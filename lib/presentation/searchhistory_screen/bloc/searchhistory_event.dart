// ignore_for_file: must_be_immutable

part of 'searchhistory_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Searchhistory widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SearchhistoryEvent extends Equatable {}

/// Event that is dispatched when the Searchhistory widget is first created.
class SearchhistoryInitialEvent extends SearchhistoryEvent {
  @override
  List<Object?> get props => [];
}
