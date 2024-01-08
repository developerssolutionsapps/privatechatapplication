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
}
