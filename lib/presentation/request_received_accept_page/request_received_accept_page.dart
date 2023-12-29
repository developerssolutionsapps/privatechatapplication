import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';

// ignore_for_file: must_be_immutable
class RequestReceivedAcceptPage extends StatefulWidget {
  const RequestReceivedAcceptPage({Key? key})
      : super(
          key: key,
        );

  @override
  RequestReceivedAcceptPageState createState() =>
      RequestReceivedAcceptPageState();
  static Widget builder(BuildContext context) {
    return RequestReceivedAcceptPage();
  }
}

class RequestReceivedAcceptPageState extends State<RequestReceivedAcceptPage>
    with AutomaticKeepAliveClientMixin<RequestReceivedAcceptPage> {
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
              SizedBox(height: 530.v),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 173.h,
                    right: 209.h,
                  ),
                  child: Text(
                    "lbl_1".tr,
                    style: CustomTextStyles.titleMediumGray200,
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
