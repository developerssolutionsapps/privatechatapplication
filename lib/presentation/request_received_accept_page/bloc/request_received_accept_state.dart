// ignore_for_file: must_be_immutable

part of 'request_received_accept_bloc.dart';

/// Represents the state of RequestReceivedAccept in the application.
class RequestReceivedAcceptState extends Equatable {
  RequestReceivedAcceptState({this.requestReceivedAcceptModelObj});

  RequestReceivedAcceptModel? requestReceivedAcceptModelObj;

  @override
  List<Object?> get props => [
        requestReceivedAcceptModelObj,
      ];
  RequestReceivedAcceptState copyWith(
      {RequestReceivedAcceptModel? requestReceivedAcceptModelObj}) {
    return RequestReceivedAcceptState(
      requestReceivedAcceptModelObj:
          requestReceivedAcceptModelObj ?? this.requestReceivedAcceptModelObj,
    );
  }
}
