// ignore_for_file: must_be_immutable

part of 'mine_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Mine widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MineEvent extends Equatable {}

/// Event that is dispatched when the Mine widget is first created.
class MineInitialEvent extends MineEvent {
  @override
  List<Object?> get props => [];
}
