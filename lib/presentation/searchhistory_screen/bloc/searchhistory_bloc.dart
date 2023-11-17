import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:private_chat/presentation/searchhistory_screen/models/searchhistory_model.dart';
part 'searchhistory_event.dart';
part 'searchhistory_state.dart';

/// A bloc that manages the state of a Searchhistory according to the event that is dispatched to it.
class SearchhistoryBloc extends Bloc<SearchhistoryEvent, SearchhistoryState> {
  SearchhistoryBloc(SearchhistoryState initialState) : super(initialState) {
    on<SearchhistoryInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SearchhistoryInitialEvent event,
    Emitter<SearchhistoryState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
  }
}
