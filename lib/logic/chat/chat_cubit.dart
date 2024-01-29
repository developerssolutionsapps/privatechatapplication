import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:private_chat/domain/models/message.dart';
import 'package:private_chat/domain/models/request.dart';
import 'package:private_chat/domain/repositories/messages_repository.dart';
import 'package:uuid/uuid.dart';

import '../../core/enums/message_type.dart';
import '../../domain/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/user_repository.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final MessagesRepository _messagesRepository;
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  ChatCubit(
      this._messagesRepository, this._authRepository, this._userRepository)
      : super(ChatInitial());

  Stream<List<Message>> getMessages({
    required String senderUserId,
    required String receiverUserId,
  }) {
    return _messagesRepository.getMessagesList(
      senderUserId: senderUserId,
      receiverUserId: receiverUserId,
    );
  }

  Future<void> receiveMessages({required Request request}) async {
    final String senderPhone = _authRepository.currentUser!.phoneNumber;
    final String receiverPhone =
        request.sender == senderPhone ? request.receiver : request.sender;
    final UserModel? senderUser =
        await _userRepository.findUserWithPhone(senderPhone);
    final UserModel? receiverUser =
        await _userRepository.findUserWithPhone(receiverPhone);
    final String senderUserId = senderUser!.phone;
    final String receiverUserId = receiverUser!.phone;

    Stream<List<Message>> messages = getMessages(
      senderUserId: senderUserId,
      receiverUserId: receiverUserId,
    );

    messages.listen((messageList) {
      emit(ChatMessageListState(messageList));
    });
  }

  void sendTextMessage(Request request, String msg) async {
    final id = Uuid().v1();
    final createdAt = DateTime.timestamp();
    final sender = _authRepository.currentUser!.phoneNumber;
    final receiver =
        request.sender == sender ? request.receiver : request.sender;
    final senderUser = await _userRepository.findUserWithPhone(sender);
    final receiverUser = await _userRepository.findUserWithPhone(receiver);
    if (senderUser == null) return;
    if (receiverUser == null) return;
    Message message = Message(
      id: id,
      sender: senderUser.id,
      receiver: receiverUser.id,
      message: msg,
      createdAt: createdAt,
      fileUrl: "",
      messageType: MessageType.text,
    );
    emit(ChatMessageSendingState(msg, message.messageType));

    try {
      await _messagesRepository.sendTextMessage(message);
      emit(ChatMessageSentState());
    } catch (e) {
      emit(ChatMessageSendingErrorState(
          "There was an error sending text message"));
    }

    // emit(ChatSendingState());

    // try {
    //   await _messagesRepository.sendTextMessage(message);
    //   emit(ChatSentState(message));
    // } catch (e) {
    //   emit(ChatErrorState('Failed to send message: $e'));
    // }
  }

  void sendFileMessage(
      Request request, File file, MessageType messageType) async {
    final id = Uuid().v1();
    final createdAt = DateTime.timestamp();
    final sender = _authRepository.currentUser!.phoneNumber;
    final receiver =
        request.sender == sender ? request.receiver : request.sender;
    Message message = Message(
        id: id,
        sender: sender,
        receiver: receiver,
        message: "",
        createdAt: createdAt,
        fileUrl: "",
        messageType: messageType);
    emit(ChatFileSendingState(file, message.messageType));

    try {
      await _messagesRepository.sendFileMessage(message, true, file);
      emit(ChatFileSentState(message, message.messageType));
    } catch (e) {
      emit(ChatFileSendingErrorState('Failed to send file: $e'));
    }
  }
}
