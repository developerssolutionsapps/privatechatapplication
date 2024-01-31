part of 'request_cubit.dart';

sealed class RequestState extends Equatable {
  const RequestState();

  @override
  List<Object> get props => [];
}

final class RequestInitial extends RequestState {}

final class RequestLoadingState extends RequestState {}

final class ConnectedState extends RequestState {}

final class RequestGetSuccess extends RequestState {
  final List<Request> requestsReceived;
  final List<Request> requestsSent;
  const RequestGetSuccess({
    required this.requestsReceived,
    required this.requestsSent,
  });
}

final class RequestCreateFailure extends RequestState {}

final class RequestCancelSuccessfulState extends RequestState {}

final class RequestCancelFailurefulState extends RequestState {}

final class RequestInviteInProgress extends RequestState {}

final class RequestInviteSuccessful extends RequestState {}

final class RequestInviteFailed extends RequestState {
  final String error;
  const RequestInviteFailed({required this.error});
}

final class RequestFailure extends RequestState {}

final class RequestAmConnected extends RequestState {
  final Request request;
  const RequestAmConnected({required this.request});
}

final class RequestUserAlreadyConnectedState extends RequestState {
  final Request request;
  const RequestUserAlreadyConnectedState({required this.request});
}

final class RequestNoneConnectedState extends RequestState {}
