// ignore_for_file: must_be_immutable

part of 'chatinterface_bloc.dart';

/// Represents the state of Chatinterface in the application.
class ChatinterfaceState extends Equatable {
  ChatinterfaceState({
    this.duisauteiruredolorinreprehendeController,
    this.radioGroup = "",
    this.chatinterfaceModelObj,
  });

  TextEditingController? duisauteiruredolorinreprehendeController;

  ChatinterfaceModel? chatinterfaceModelObj;

  String radioGroup;

  @override
  List<Object?> get props => [
        duisauteiruredolorinreprehendeController,
        radioGroup,
        chatinterfaceModelObj,
      ];
  ChatinterfaceState copyWith({
    TextEditingController? duisauteiruredolorinreprehendeController,
    String? radioGroup,
    ChatinterfaceModel? chatinterfaceModelObj,
  }) {
    return ChatinterfaceState(
      duisauteiruredolorinreprehendeController:
          duisauteiruredolorinreprehendeController ??
              this.duisauteiruredolorinreprehendeController,
      radioGroup: radioGroup ?? this.radioGroup,
      chatinterfaceModelObj:
          chatinterfaceModelObj ?? this.chatinterfaceModelObj,
    );
  }
}
