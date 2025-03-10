import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:private_chat/presentation/app.dart';

import 'core/app_bloc_observer.dart';
import 'core/app_export.dart';
import 'firebase_options.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = AppBlocObserver();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()
  ]).then((value) {
    runApp(App());
  });
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ThemeBloc(
//         ThemeState(
//           themeType: PrefUtils().getThemeData(),
//         ),
//       ),
//       child: BlocBuilder<ThemeBloc, ThemeState>(
//         builder: (context, state) {
//           return MaterialApp(
//             theme: theme,
//             title: 'private_chat',
//             navigatorKey: NavigatorService.navigatorKey,
//             debugShowCheckedModeBanner: false,
//             localizationsDelegates: [
//               AppLocalizationDelegate(),
//               GlobalMaterialLocalizations.delegate,
//               GlobalWidgetsLocalizations.delegate,
//               GlobalCupertinoLocalizations.delegate,
//             ],
//             supportedLocales: [
//               Locale(
//                 'en',
//                 '',
//               ),
//             ],
//             initialRoute: AppRoutes.initialRoute,
//             routes: AppRoutes.routes,
//           );
//         },
//       ),
//     );
//   }
// }
