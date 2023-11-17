// ignore_for_file: must_be_immutable

part of 'account_delete_bloc.dart';

/// Represents the state of AccountDelete in the application.
class AccountDeleteState extends Equatable {
  AccountDeleteState({this.accountDeleteModelObj});

  AccountDeleteModel? accountDeleteModelObj;

  @override
  List<Object?> get props => [
        accountDeleteModelObj,
      ];
  AccountDeleteState copyWith({AccountDeleteModel? accountDeleteModelObj}) {
    return AccountDeleteState(
      accountDeleteModelObj:
          accountDeleteModelObj ?? this.accountDeleteModelObj,
    );
  }
}
