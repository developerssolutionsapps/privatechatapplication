part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class LoadingState extends UserState {}

final class UserMyProfileState extends UserState {
  final UserModel? user;
  const UserMyProfileState(this.user);
  @override
  List<Object> get props => [user!];
}

final class UserNeedsProfileSetUp extends UserState {}

// ignore: must_be_immutable
final class UserProfileSetupInProgressState extends UserState {
  final ProfileSetUp profileSetUp;

  UserProfileSetupInProgressState(
    this.profileSetUp,
  );

  @override
  List<Object> get props => [profileSetUp];
}

final class UserProfileSetUpSuccess extends UserState {
  final UserModel user;
  const UserProfileSetUpSuccess(this.user);
  @override
  List<Object> get props => [user];
}

final class UserErrorState extends UserState {
  final String error;
  const UserErrorState(this.error);
  @override
  List<Object> get props => [error];
}

final class UserDeletedSuccessful extends UserState {}

final class UserConnectedLoadingState extends UserState {}

final class UserConnectedMyProfileState extends UserState {
  final UserModel? user;
  const UserConnectedMyProfileState(this.user);
  @override
  List<Object> get props => [user!];
}
