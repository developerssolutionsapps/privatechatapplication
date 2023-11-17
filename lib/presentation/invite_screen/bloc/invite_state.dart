// ignore_for_file: must_be_immutable

part of 'invite_bloc.dart';

/// Represents the state of Invite in the application.
class InviteState extends Equatable {
  InviteState({
    this.phoneNumberController,
    this.selectedCountry,
    this.inviteModelObj,
  });

  TextEditingController? phoneNumberController;
  TextEditingController? countryCodeController;

  InviteModel? inviteModelObj;

  Country? selectedCountry;

  @override
  List<Object?> get props => [
        phoneNumberController,
        selectedCountry,
        inviteModelObj,
      ];
  InviteState copyWith({
    TextEditingController? phoneNumberController,
    Country? selectedCountry,
    InviteModel? inviteModelObj,
  }) {
    return InviteState(
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      inviteModelObj: inviteModelObj ?? this.inviteModelObj,
    );
  }
}
