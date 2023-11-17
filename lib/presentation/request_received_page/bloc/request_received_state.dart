// ignore_for_file: must_be_immutable

part of 'request_received_bloc.dart';

/// Represents the state of RequestReceived in the application.
class RequestReceivedState extends Equatable {
  RequestReceivedState({this.requestReceivedModelObj});

  RequestReceivedModel? requestReceivedModelObj;

  @override
  List<Object?> get props => [
        requestReceivedModelObj,
      ];
  RequestReceivedState copyWith(
      {RequestReceivedModel? requestReceivedModelObj}) {
    return RequestReceivedState(
      requestReceivedModelObj:
          requestReceivedModelObj ?? this.requestReceivedModelObj,
    );
  }
}
