// ignore_for_file: must_be_immutable

part of 'searchhistory_bloc.dart';

/// Represents the state of Searchhistory in the application.
class SearchhistoryState extends Equatable {
  SearchhistoryState({
    this.searchController,
    this.searchhistoryModelObj,
  });

  TextEditingController? searchController;

  SearchhistoryModel? searchhistoryModelObj;

  @override
  List<Object?> get props => [
        searchController,
        searchhistoryModelObj,
      ];
  SearchhistoryState copyWith({
    TextEditingController? searchController,
    SearchhistoryModel? searchhistoryModelObj,
  }) {
    return SearchhistoryState(
      searchController: searchController ?? this.searchController,
      searchhistoryModelObj:
          searchhistoryModelObj ?? this.searchhistoryModelObj,
    );
  }
}
