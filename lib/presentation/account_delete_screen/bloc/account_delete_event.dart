// ignore_for_file: must_be_immutable

part of 'account_delete_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AccountDelete widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AccountDeleteEvent extends Equatable {}

/// Event that is dispatched when the AccountDelete widget is first created.
class AccountDeleteInitialEvent extends AccountDeleteEvent {
  @override
  List<Object?> get props => [];
}
