// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [request_received_page],
/// and is typically used to hold data that is passed between different parts of the application.
class RequestReceivedModel extends Equatable {
  RequestReceivedModel() {}

  RequestReceivedModel copyWith() {
    return RequestReceivedModel();
  }

  @override
  List<Object?> get props => [];
}
