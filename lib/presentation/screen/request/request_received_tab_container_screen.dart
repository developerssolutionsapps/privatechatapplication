import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:private_chat/presentation/routes/path.dart';
import '../../../core/app_export.dart';
import '../../../domain/models/request.dart';
import '../../../logic/request/request_cubit.dart';
import '../../../logic/user/user_cubit.dart';
import '../../dialogs/generic_dialog.dart';
import '../../widgets/custom_overlayentry.dart';
import '../companion/companion_home.dart';
import '../profile/mine_page.dart';
import 'cubit/home_cubit.dart';
import 'request_sent_been_rjected_do_nothing_page.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_icon_button.dart';

class RequestReceivedTabContainerScreen extends StatefulWidget {
  const RequestReceivedTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  RequestReceivedTabContainerScreenState createState() =>
      RequestReceivedTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return RequestReceivedTabContainerScreen();
  }
}

class RequestReceivedTabContainerScreenState
    extends State<RequestReceivedTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
    context.read<RequestCubit>().findRequestAmConnected();
    context.read<RequestCubit>().getRequests();
    context.read<HomeCubit>().onRequestReceivedTab();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    context.read<UserCubit>().getMyProfile();

    return MultiBlocListener(
      listeners: [
        BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserNeedsProfileSetUp) {
              context
                  .replaceNamed(RoutePath.routeName(RoutePath.setDisplayName));
            }
            if (state is UserProfileSetupInProgressState) {
              if (state.profileSetUp.gender != null) {
                context.read<UserCubit>().completeProfileSetup();
              } else if (state.profileSetUp.birthday != null) {
                context.replaceNamed(RoutePath.routeName(RoutePath.setGender));
              } else if (state.profileSetUp.name != null) {
                context
                    .replaceNamed(RoutePath.routeName(RoutePath.setBirthday));
              }
            }
          },
        ),
        BlocListener<RequestCubit, RequestState>(
          listener: (context, state) {
            if (state is RequestInviteSuccessful) {
              Future<bool> showInviteSuccessDialog(BuildContext context) {
                return showGenericDialog(
                  context: context,
                  title: "",
                  content: "Bravo! You made it",
                  optionsBuilder: () => {
                    "Check": false,
                  },
                ).then((value) => value ?? false);
              }

              showInviteSuccessDialog(context);
            }
            if (state is RequestInviteFailed) {
              Future<bool> showInviteErrorDialog(BuildContext context) {
                return showGenericDialog(
                  context: context,
                  title: "",
                  content: state.error,
                  optionsBuilder: () => {
                    "Okay": null,
                  },
                ).then((value) => value ?? false);
              }

              showInviteErrorDialog(context);
            }
            if (state is RequestLoadingState) {
              CustomOverlayEntry.instance.hideOverlay();
              CustomOverlayEntry.instance
                  .loadingCircularProgressIndicator(context);
            } else {
              CustomOverlayEntry.instance.hideOverlay();
            }
            if (state is RequestInviteInProgress) {
              context.goNamed(RoutePath.routeName(RoutePath.requestInvite));
            }
            if (state is RequestAmConnected) {
              CustomOverlayEntry.instance.hideOverlay();
              context.goNamed(RoutePath.routeName(RoutePath.companion),
                  extra: state.request);
            }
          },
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: theme.colorScheme.onPrimaryContainer,
          body: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 49.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 59.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            context.read<HomeCubit>().onRequestReceivedTab();
                          },
                          child: BlocBuilder<HomeCubit, HomeState>(
                            builder: (context, state) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Builder(builder: (context) {
                                    if (state is HomeSentTab) {
                                      return CustomImageView(
                                        imagePath:
                                            ImageConstant.imgSearchPrimaryGray,
                                        height: 21.v,
                                        width: 19.h,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 6.v),
                                      );
                                    } else {
                                      return CustomImageView(
                                        imagePath:
                                            ImageConstant.imgSearchPrimaryGreen,
                                        height: 21.v,
                                        width: 19.h,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 6.v),
                                      );
                                    }
                                  }),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text(
                                      "received",
                                      style: (state is HomeReceivedTab)
                                          ? CustomTextStyles
                                              .headlineSmallPrimary
                                          : CustomTextStyles
                                              .headlineSmallGray70001,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<HomeCubit>().onRequestSentTab();
                          },
                          child: BlocBuilder<HomeCubit, HomeState>(
                            builder: (context, state) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Builder(builder: (context) {
                                    if (state is HomeSentTab) {
                                      return CustomImageView(
                                        imagePath:
                                            ImageConstant.imgGroup144Green70001,
                                        height: 21.v,
                                        width: 19.h,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 6.v),
                                      );
                                    } else {
                                      return CustomImageView(
                                        imagePath:
                                            ImageConstant.imgGroup144Gray70001,
                                        height: 21.v,
                                        width: 19.h,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 6.v),
                                      );
                                    }
                                  }),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text(
                                      "sent",
                                      style: (state is HomeSentTab)
                                          ? CustomTextStyles
                                              .headlineSmallPrimary
                                          : CustomTextStyles
                                              .headlineSmallGray70001,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 34.v),
                  SingleChildScrollView(child: _buildRequestTabs(context)),
                  SizedBox(
                    height: 531.v,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 51.h),
            child: _buildBottomBar(context),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRequestTabs(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, homeState) {
        if (homeState is HomeReceivedTab) {
          return BlocBuilder<RequestCubit, RequestState>(
            builder: (context, state) {
              if (state is RequestGetSuccess &&
                  state.requestsReceived.length > 0) {
                print(state.requestsReceived);
                return _buildRequestReceivedTab(
                    context, state.requestsReceived);
              } else {
                return Text("you don't have any received request yet");
              }
            },
          );
        } else if (homeState is HomeSentTab) {
          return BlocBuilder<RequestCubit, RequestState>(
            builder: (context, state) {
              if (state is RequestGetSuccess && state.requestsSent.length > 0) {
                print(state.requestsSent);
                return _buildRequestSentTab(context, state);
              } else {
                return Text("you don't have any sent request yet");
              }
            },
          );
        } else {
          return Text("you don't have any request yet");
        }
      },
    );
  }

  Widget _buildRequestReceivedTab(
      BuildContext context, List<Request> requestsReceived) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: requestsReceived.length,
      itemBuilder: ((context, index) {
        print(index);
        TabController controller = TabController(length: 2, vsync: this);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                height: 52.adaptSize,
                width: 52.adaptSize,
                padding: EdgeInsets.all(7.h),
                decoration: IconButtonStyleHelper.fillGray,
                child: CustomImageView(
                  imagePath: ImageConstant.imgProfileGray500,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 6.h,
                  top: 16.v,
                  bottom: 12.v,
                ),
                child: Text(
                  requestsReceived[index].sender,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              Spacer(),
              Container(
                height: 40.v,
                width: 140.h,
                margin: EdgeInsets.symmetric(vertical: 10.v),
                decoration: BoxDecoration(
                  color: appTheme.gray200,
                  borderRadius: BorderRadius.circular(
                    4.h,
                  ),
                ),
                child: TabBar(
                  controller: controller,
                  labelPadding: EdgeInsets.zero,
                  labelColor: appTheme.gray200,
                  labelStyle: TextStyle(
                    fontSize: 16.fSize,
                    fontFamily: 'Alibaba PuHuiTi 2.0',
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelColor: appTheme.gray500,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 16.fSize,
                    fontFamily: 'Alibaba PuHuiTi 2.0',
                    fontWeight: FontWeight.w500,
                  ),
                  indicator: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(
                      4.h,
                    ),
                  ),
                  tabs: [
                    TextButton(
                      onPressed: () async {
                        print("clicked accept  " +
                            requestsReceived[index].sender);
                        Future<bool> showAcceptDialog(BuildContext context) {
                          return showGenericDialog(
                            context: context,
                            title: "",
                            content:
                                "Are you sure you want to accept ${requestsReceived[index].sender}'s request",
                            optionsBuilder: () => {
                              "Accept": true,
                            },
                          ).then((value) => value ?? false);
                        }

                        final bool accept = await showAcceptDialog(context);
                        if (accept) {
                          context
                              .read<RequestCubit>()
                              .acceptRequest(requestsReceived[index]);
                        }
                      },
                      child: Text(
                        "accept",
                        style: TextStyle(
                          color: appTheme.gray100,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        print("clicked reject  " +
                            requestsReceived[index].sender);
                        Future<bool> showRejectDialog(BuildContext context) {
                          return showGenericDialog(
                            context: context,
                            title: "",
                            content:
                                "Are you sure you want to reject ${requestsReceived[index].sender}'s request",
                            optionsBuilder: () => {
                              "Reject": true,
                            },
                          ).then((value) => value ?? false);
                        }

                        final bool reject = await showRejectDialog(context);
                        if (reject) {
                          context
                              .read<RequestCubit>()
                              .rejectRequest(requestsReceived[index]);
                        }
                      },
                      child: Tab(
                        child: Text(
                          "reject",
                          style: TextStyle(
                            color: appTheme.gray500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildRequestSentTab(BuildContext context, RequestGetSuccess state) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: state.requestsSent.length,
      itemBuilder: ((context, index) {
        print(index);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                height: 56.adaptSize,
                width: 56.adaptSize,
                padding: EdgeInsets.all(6.h),
                decoration: IconButtonStyleHelper.fillGray,
                child: CustomImageView(
                  imagePath: ImageConstant.imgProfileGreenA200,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 4.h,
                  top: 14.v,
                  bottom: 18.v,
                ),
                child: Text(
                  state.requestsSent[index].receiver,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              Spacer(),
              Builder(builder: (context) {
                if (state.requestsSent[index].accepted == null) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.v),
                    child: Text(
                      "pending",
                      style: theme.textTheme.titleMedium,
                    ),
                  );
                } else if (!state.requestsSent[index].accepted!) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.v),
                    child: Text(
                      "rejected",
                      style: theme.textTheme.titleMedium,
                    ),
                  );
                } else if (state.requestsSent[index].accepted!) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.v),
                    child: Text(
                      "accepted",
                      style: theme.textTheme.titleMedium,
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.v),
                    child: Text(
                      "pending",
                      style: theme.textTheme.titleMedium,
                    ),
                  );
                }
              }),
            ],
          ),
        );
      }),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        print(type.toString());
        print(getCurrentRoute(type));
        context.goNamed(RoutePath.routeName(getCurrentRoute(type)));
      },
      selectedIndex: 1,
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Companion:
        return RoutePath.companion;
      case BottomBarEnum.Request:
        return RoutePath.main;
      case BottomBarEnum.Entertainment:
        return RoutePath.entertainment;
      case BottomBarEnum.Mine:
        return RoutePath.mine;
      default:
        return RoutePath.main;
    }
  }

  // ///Handling page based on route
  // Widget getCurrentPage(
  //   BuildContext context,
  //   String currentRoute,
  // ) {
  //   switch (currentRoute) {
  //     case AppRoutes.companionSNameWhenAcceptedPage:
  //       return CompanionSNameWhenAcceptedPage.builder(context);
  //     case AppRoutes.requestSentBeenRjectedDoNothingPage:
  //       return RequestSentBeenRjectedDoNothingPage.builder(context);
  //     case AppRoutes.minePage:
  //       return MinePage.builder(context);
  //     default:
  //       return DefaultWidget();
  //   }
  // }
}
