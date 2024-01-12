import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class RequestReceivedPage extends StatefulWidget {
  const RequestReceivedPage({super.key});

  @override
  RequestReceivedPageState createState() => RequestReceivedPageState();
}

class RequestReceivedPageState extends State<RequestReceivedPage>
    with AutomaticKeepAliveClientMixin<RequestReceivedPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Column(
            children: [
              SizedBox(height: 529.v),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 23.v,
                  width: 16.h,
                  margin: EdgeInsets.only(
                    left: 167.h,
                    right: 206.h,
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgGroup25,
                        height: 16.adaptSize,
                        width: 16.adaptSize,
                        alignment: Alignment.center,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.h),
                          child: Text(
                            "1",
                            style: CustomTextStyles.titleMediumGray200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
