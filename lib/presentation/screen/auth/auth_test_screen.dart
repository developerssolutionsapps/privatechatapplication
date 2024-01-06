import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/auth_repository_impl.dart';
import '../../../domain/models/user_model.dart';
import '../../../logic/auth/auth_bloc.dart';

// Import your AuthRepository and AuthBloc...

class AuthWidget extends StatefulWidget {
  static Widget builder(BuildContext context) {
    return AuthWidget();
  }

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    final authRepository = AuthRepositoryImpl(
      FirebaseAuth.instance,
      FirebaseFirestore.instance,
    );
    _authBloc = AuthBloc(authRepository);
  }

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Authentication'),
        ),
        body: Builder(builder: (context) {
          return Center(
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                //   if (state == AuthStateOnInitialize) {
                //     print("state initalized");
                //   } else if (state == AuthStateLoggedOut) {
                //     print("state logged out");
                //   } else if (state == AuthStateLoggedIn) {
                //     print("state logged in");
                //   } else if (state == AuthStateCodeSent) {
                //     print("state code sent");
                //   }
                //   print(state.toString());
                print('Auth state changed: $state');
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _authBloc.add(AuthEventInitialize());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Initialize Authentication'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _authBloc.add(AuthEventLogin(phone: '+254701143038'));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Login with Phone Number'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _authBloc.add(AuthEventVerifyCode(code: 123456));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Verify Code'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _authBloc.add(AuthEventLogout());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Logout'),
                      ),
                    ),
                    SizedBox(height: 20),
                    StreamBuilder<UserModel>(
                      stream: _authBloc
                          .currentUserDataStream, // Assuming you have a stream for current user data
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text('Current User: ${snapshot.data!}');
                        } else {
                          return Text('No user data available');
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
