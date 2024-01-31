import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/data/repositories/messages_repository_impl.dart';
import 'package:private_chat/domain/models/request.dart';
import 'package:private_chat/logic/chat/chat_cubit.dart';
import 'package:private_chat/logic/request/request_cubit.dart';
import 'package:private_chat/logic/user/user_cubit.dart';
import 'package:private_chat/presentation/routes/path.dart';
import 'package:private_chat/presentation/screen/auth/otp_screen.dart';
import 'package:private_chat/presentation/screen/auth/sign_in.dart';
import 'package:private_chat/presentation/screen/common/splash_screen.dart';
import 'package:private_chat/presentation/screen/companion/companion_home.dart';
import 'package:private_chat/presentation/screen/entertainment/chat_screen.dart';
import 'package:private_chat/presentation/screen/entertainment/entertainment_screen.dart';
import 'package:private_chat/presentation/screen/profile/mine_page.dart';
import 'package:private_chat/presentation/screen/profile/set_birthday.dart';
import 'package:private_chat/presentation/screen/profile/set_display_name.dart';
import 'package:private_chat/presentation/screen/profile/set_gender.dart';
import 'package:private_chat/presentation/screen/request/cubit/home_cubit.dart';
import 'package:private_chat/presentation/screen/request/invite_screen.dart';
import 'package:private_chat/presentation/screen/request/request_received_tab_container_screen.dart';

import '../data/repositories/auth_repository_impl.dart';
import '../data/repositories/request_repository_impl.dart';
import '../data/repositories/user_repository_impl.dart';
import '../logic/auth/auth_bloc.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocRepoAndProvider(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => primaryFocus?.unfocus(),
        child: MaterialApp.router(
          title: 'PrivateChat',
          debugShowCheckedModeBanner: false,
          theme: theme,
          routerConfig: router,
        ),
      ),
    );
  }

  final multiblocProvider = [];
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: RoutePath.splash, builder: (_, state) => const SplashScreen()),
      GoRoute(path: RoutePath.signin, builder: (_, state) => SignInScreen()),
      GoRoute(
          path: RoutePath.otpScreen,
          builder: (_, state) => OtpScreen(
                verificationId: (state.extra) as String,
              )),
      GoRoute(
          path: RoutePath.main,
          builder: (_, state) => const RequestReceivedTabContainerScreen(),
          routes: [
            GoRoute(
                name: RoutePath.routeName(RoutePath.setDisplayName),
                path: RoutePath.setDisplayName,
                builder: (_, state) => SetDisplayName()),
            GoRoute(
                name: RoutePath.routeName(RoutePath.setBirthday),
                path: RoutePath.setBirthday,
                builder: (_, state) => SetBirthday()),
            GoRoute(
                name: RoutePath.routeName(RoutePath.setGender),
                path: RoutePath.setGender,
                builder: (_, state) => SetGender()),
            GoRoute(
                name: RoutePath.routeName(RoutePath.requestInvite),
                path: RoutePath.requestInvite,
                builder: (_, state) => InviteScreen()),
            GoRoute(
                name: RoutePath.routeName(RoutePath.companion),
                path: RoutePath.companion,
                builder: (_, state) => state.extra == null
                    ? CompanionHome(
                        request: null,
                      )
                    : CompanionHome(
                        request: (state.extra) as Request,
                      )),
            GoRoute(
                name: RoutePath.routeName(RoutePath.chat),
                path: RoutePath.chat,
                builder: (_, state) => ChatScreen(
                      request: (state.extra) as Request,
                    )),
            GoRoute(
                name: RoutePath.routeName(RoutePath.entertainment),
                path: RoutePath.entertainment,
                builder: (_, state) => EntertainmentScreen()),
            GoRoute(
                name: RoutePath.routeName(RoutePath.mine),
                path: RoutePath.mine,
                builder: (_, state) => MinePage()),
          ]),
    ],
  );
}

CustomTransitionPage<dynamic> _slideTransitionPage(Widget child) {
  return CustomTransitionPage(
      child: child,
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}

class MultiBlocRepoAndProvider extends StatelessWidget {
  final Widget child;
  const MultiBlocRepoAndProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (_) => AuthRepositoryImpl()),
          RepositoryProvider(create: (_) => UserRepositoryImpl()),
          RepositoryProvider(create: (_) => RequestRepositoryImpl()),
          RepositoryProvider(create: (_) => MessagesRepositoryImpl()),
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider(
            create: (_) =>
                AuthBloc(RepositoryProvider.of<AuthRepositoryImpl>(_)),
          ),
          BlocProvider(
            create: (_) => UserCubit(
              RepositoryProvider.of<UserRepositoryImpl>(_),
              RepositoryProvider.of<AuthRepositoryImpl>(_),
            ),
          ),
          BlocProvider(
            create: (_) => RequestCubit(
              RepositoryProvider.of<RequestRepositoryImpl>(_),
              RepositoryProvider.of<UserRepositoryImpl>(_),
              RepositoryProvider.of<AuthRepositoryImpl>(_),
            ),
          ),
          BlocProvider(
            create: (_) => HomeCubit(),
          ),
          BlocProvider(
            create: (_) => ChatCubit(
              RepositoryProvider.of<MessagesRepositoryImpl>(_),
              RepositoryProvider.of<AuthRepositoryImpl>(_),
              RepositoryProvider.of<UserRepositoryImpl>(_),
            ),
          ),
        ], child: child));
  }
}
