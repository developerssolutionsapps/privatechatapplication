// ignore_for_file: must_be_immutable

part of 'invite_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Invite widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class InviteEvent extends Equatable {}

/// Event that is dispatched when the Invite widget is first created.
class InviteInitialEvent extends InviteEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing country code
class ChangeCountryEvent extends InviteEvent {
  ChangeCountryEvent({required this.value});

  Country value;

  @override
  List<Object?> get props => [
        value,
      ];
}
