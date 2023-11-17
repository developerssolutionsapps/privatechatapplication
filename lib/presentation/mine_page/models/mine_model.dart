// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [mine_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MineModel extends Equatable {
  MineModel() {}

  MineModel copyWith() {
    return MineModel();
  }

  @override
  List<Object?> get props => [];
}
