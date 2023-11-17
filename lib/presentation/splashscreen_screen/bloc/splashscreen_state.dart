// ignore_for_file: must_be_immutable

part of 'splashscreen_bloc.dart';

/// Represents the state of Splashscreen in the application.
class SplashscreenState extends Equatable {
  SplashscreenState({this.splashscreenModelObj});

  SplashscreenModel? splashscreenModelObj;

  @override
  List<Object?> get props => [
        splashscreenModelObj,
      ];
  SplashscreenState copyWith({SplashscreenModel? splashscreenModelObj}) {
    return SplashscreenState(
      splashscreenModelObj: splashscreenModelObj ?? this.splashscreenModelObj,
    );
  }
}
