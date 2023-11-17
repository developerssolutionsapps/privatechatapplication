// ignore_for_file: must_be_immutable

part of 'request_received_tab_container_bloc.dart';

/// Represents the state of RequestReceivedTabContainer in the application.
class RequestReceivedTabContainerState extends Equatable {
  RequestReceivedTabContainerState({this.requestReceivedTabContainerModelObj});

  RequestReceivedTabContainerModel? requestReceivedTabContainerModelObj;

  @override
  List<Object?> get props => [
        requestReceivedTabContainerModelObj,
      ];
  RequestReceivedTabContainerState copyWith(
      {RequestReceivedTabContainerModel? requestReceivedTabContainerModelObj}) {
    return RequestReceivedTabContainerState(
      requestReceivedTabContainerModelObj:
          requestReceivedTabContainerModelObj ??
              this.requestReceivedTabContainerModelObj,
    );
  }
}
