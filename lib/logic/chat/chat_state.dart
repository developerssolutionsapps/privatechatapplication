part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatSendingState extends ChatState {}

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

  ChatFileSentState(this.sentMessage);

  @override
  List<Object> get props => [sentMessage];
}

class ChatFileSendingErrorState extends ChatState {
  final String errorMessage;

  ChatFileSendingErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
