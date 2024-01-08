import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:private_chat/domain/models/message.dart';
import 'package:private_chat/domain/repositories/messages_repository.dart';

import '../../core/enums/message_type.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final MessagesRepository _messagesRepository;

  ChatCubit(this._messagesRepository) : super(ChatInitial());

  Stream<List<Message>> getMessages({
    required String senderUserId,
    required String receiverUserId,
  }) {
    return _messagesRepository.getMessagesList(
      senderUserId: senderUserId,
      receiverUserId: receiverUserId,
    );
  }

  void receiveMessages({
    required String senderUserId,
    required String receiverUserId,
  }) {
    Stream<List<Message>> messages = getMessages(
      senderUserId: senderUserId,
      receiverUserId: receiverUserId,
    );

    messages.listen((messageList) {
      emit(ChatMessageListState(messageList));
    });
  }

  void sendTextMessage(Message message) async {
    emit(ChatSendingState());

    try {
      await _messagesRepository.sendTextMessage(message);
      emit(ChatSentState(message));
    } catch (e) {
      emit(ChatErrorState('Failed to send message: $e'));
    }
  }

  void sendFileMessage(Message message, File file) async {
    emit(ChatFileSendingState(file, message.messageType));

    try {
      await _messagesRepository.sendFileMessage(message, true, file);
      emit(ChatFileSentState(message));
    } catch (e) {
      emit(ChatFileSendingErrorState('Failed to send file: $e'));
    }
  }
}
