// ignore_for_file: must_be_immutable

part of 'splashscreen_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Splashscreen widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SplashscreenEvent extends Equatable {}

/// Event that is dispatched when the Splashscreen widget is first created.
class SplashscreenInitialEvent extends SplashscreenEvent {
  @override
  List<Object?> get props => [];
}
