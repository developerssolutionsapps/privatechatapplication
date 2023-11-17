// ignore_for_file: must_be_immutable

part of 'request_received_reject_bloc.dart';

/// Represents the state of RequestReceivedReject in the application.
class RequestReceivedRejectState extends Equatable {
  RequestReceivedRejectState({this.requestReceivedRejectModelObj});

  RequestReceivedRejectModel? requestReceivedRejectModelObj;

  @override
  List<Object?> get props => [
        requestReceivedRejectModelObj,
      ];
  RequestReceivedRejectState copyWith(
      {RequestReceivedRejectModel? requestReceivedRejectModelObj}) {
    return RequestReceivedRejectState(
      requestReceivedRejectModelObj:
          requestReceivedRejectModelObj ?? this.requestReceivedRejectModelObj,
    );
  }
}
