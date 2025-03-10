part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeSentTab extends HomeState {}

final class HomeReceivedTab extends HomeState {}

final class HomeClickedAcceptRequest extends HomeState {}
