// ignore_for_file: must_be_immutable

part of 'chatinterface_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Chatinterface widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ChatinterfaceEvent extends Equatable {}

/// Event that is dispatched when the Chatinterface widget is first created.
class ChatinterfaceInitialEvent extends ChatinterfaceEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing radio button
class ChangeRadioButtonEvent extends ChatinterfaceEvent {
  ChangeRadioButtonEvent({required this.value});

  String value;

  @override
  List<Object?> get props => [
        value,
      ];
}
