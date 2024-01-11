import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/app_export.dart';
import '../../../logic/auth/auth_bloc.dart';
import '../../routes/path.dart';
import '../../widgets/custom_overlayentry.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => _checkAuth());
  }

  _checkAuth() async {
    context.read<AuthBloc>().add(AuthEventInitialize());
  }

  _listenAuthState(String id) {
    context.replace(RoutePath.main);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateLoggedIn)
          context.replace(RoutePath.setDisplayName);
        if (state is Loading) {
          CustomOverlayEntry.instance.loadingCircularProgressIndicator(context);
        }
        if (state is AuthStateLoggedOut) {
          CustomOverlayEntry.instance.hideOverlay();
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5.v),
                SizedBox(
                  height: 167.v,
                  width: 152.h,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgGroup108,
                        height: 109.v,
                        width: 95.h,
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(right: 20.h),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Private",
                          style: CustomTextStyles.displayMediumOnPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
