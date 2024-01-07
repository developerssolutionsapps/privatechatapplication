part of 'request_cubit.dart';

sealed class RequestState extends Equatable {
  const RequestState();

  @override
  List<Object> get props => [];
}

final class RequestInitial extends RequestState {}

final class LoadingState extends RequestState {}

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

final class RequestFailure extends RequestState {}
