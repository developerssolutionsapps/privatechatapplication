// ignore_for_file: must_be_immutable

part of 'mine_bloc.dart';

/// Represents the state of Mine in the application.
class MineState extends Equatable {
  MineState({
    this.notShownController,
    this.mineModelObj,
  });

  TextEditingController? notShownController;

  MineModel? mineModelObj;

  @override
  List<Object?> get props => [
        notShownController,
        mineModelObj,
      ];
  MineState copyWith({
    TextEditingController? notShownController,
    MineModel? mineModelObj,
  }) {
    return MineState(
      notShownController: notShownController ?? this.notShownController,
      mineModelObj: mineModelObj ?? this.mineModelObj,
    );
  }
}
