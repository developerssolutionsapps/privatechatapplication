part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatSendingState extends ChatState {}

class ChatMessageListState extends ChatState {
  final List<Message> messageList;

  ChatMessageListState(this.messageList);

  @override
  List<Object> get props => [messageList];
}

class ChatSentState extends ChatState {
  final Message sentMessage;

  ChatSentState(this.sentMessage);

  @override
  List<Object> get props => [sentMessage];
}

class ChatReceivedState extends ChatState {
  final Message receivedMessage;

  ChatReceivedState(this.receivedMessage);

  @override
  List<Object> get props => [receivedMessage];
}

class ChatErrorState extends ChatState {
  final String errorMessage;

  ChatErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class ChatFileSendingState extends ChatState {
  final File file;
  final MessageType type;

  ChatFileSendingState(this.file, this.type);

  @override
  List<Object> get props => [file, type];
}

class ChatFileSentState extends ChatState {
  final Message sentMessage;

  ChatFileSentState(this.sentMessage, MessageType messageType);

  @override
  List<Object> get props => [sentMessage];
}

class ChatFileSendingErrorState extends ChatState {
  final String errorMessage;

  ChatFileSendingErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class ChatMessageSendingState extends ChatState {
  final String message;
  final MessageType type;

  ChatMessageSendingState(this.message, this.type);

  @override
  List<Object> get props => [message, type];
}

class ChatMessageSentState extends ChatState {}

class ChatMessageSendingErrorState extends ChatState {
  final String errorMessage;

  ChatMessageSendingErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
