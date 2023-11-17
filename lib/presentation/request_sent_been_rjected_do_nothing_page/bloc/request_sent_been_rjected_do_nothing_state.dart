// ignore_for_file: must_be_immutable

part of 'request_sent_been_rjected_do_nothing_bloc.dart';

/// Represents the state of RequestSentBeenRjectedDoNothing in the application.
class RequestSentBeenRjectedDoNothingState extends Equatable {
  RequestSentBeenRjectedDoNothingState(
      {this.requestSentBeenRjectedDoNothingModelObj});

  RequestSentBeenRjectedDoNothingModel? requestSentBeenRjectedDoNothingModelObj;

  @override
  List<Object?> get props => [
        requestSentBeenRjectedDoNothingModelObj,
      ];
  RequestSentBeenRjectedDoNothingState copyWith(
      {RequestSentBeenRjectedDoNothingModel?
          requestSentBeenRjectedDoNothingModelObj}) {
    return RequestSentBeenRjectedDoNothingState(
      requestSentBeenRjectedDoNothingModelObj:
          requestSentBeenRjectedDoNothingModelObj ??
              this.requestSentBeenRjectedDoNothingModelObj,
    );
  }
}
