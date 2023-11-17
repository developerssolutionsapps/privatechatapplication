import 'bloc/searchhistory_bloc.dart';
import 'models/searchhistory_model.dart';
import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/widgets/custom_search_view.dart';

class SearchhistoryScreen extends StatelessWidget {
  const SearchhistoryScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SearchhistoryBloc>(
        create: (context) => SearchhistoryBloc(
            SearchhistoryState(searchhistoryModelObj: SearchhistoryModel()))
          ..add(SearchhistoryInitialEvent()),
        child: SearchhistoryScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 5.v),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgArrowLeft,
                          height: 17.v,
                          width: 8.h,
                          margin: EdgeInsets.only(top: 6.v, bottom: 762.v),
                          onTap: () {
                            onTapImgArrowLeft(context);
                          }),
                      _buildTwentyTwo(context)
                    ]))));
  }

  /// Section Widget
  Widget _buildTwentyTwo(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.only(left: 26.h, bottom: 756.v),
            padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 3.v),
            decoration: AppDecoration.outlineDeeppurpleA20001
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 1.v),
                  BlocSelector<SearchhistoryBloc, SearchhistoryState,
                          TextEditingController?>(
                      selector: (state) => state.searchController,
                      builder: (context, searchController) {
                        return CustomSearchView(
                            width: 20.adaptSize, controller: searchController);
                      })
                ])));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
