// ignore_for_file: must_be_immutable

part of 'profilesetup_location_bloc.dart';

/// Represents the state of ProfilesetupLocation in the application.
class ProfilesetupLocationState extends Equatable {
  ProfilesetupLocationState({
    this.searchBarController,
    this.profilesetupLocationModelObj,
  });

  TextEditingController? searchBarController;

  ProfilesetupLocationModel? profilesetupLocationModelObj;

  @override
  List<Object?> get props => [
        searchBarController,
        profilesetupLocationModelObj,
      ];
  ProfilesetupLocationState copyWith({
    TextEditingController? searchBarController,
    ProfilesetupLocationModel? profilesetupLocationModelObj,
  }) {
    return ProfilesetupLocationState(
      searchBarController: searchBarController ?? this.searchBarController,
      profilesetupLocationModelObj:
          profilesetupLocationModelObj ?? this.profilesetupLocationModelObj,
    );
  }
}
