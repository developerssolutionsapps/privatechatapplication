import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();

  static Widget builder(BuildContext context) {
    return PhoneAuthScreen();
  }
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationId = "";
  late String smsCode = "";

  Future<void> verifyPhone() async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      _auth.signInWithCredential(authResult);
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print('Phone number verification failed: ${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int? forceResend]) {
      verificationId = verId;
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      verificationId = verId;
    };

    await _auth.verifyPhoneNumber(
      phoneNumber: '+254791623541',
      timeout: const Duration(seconds: 60),
      verificationCompleted: verified,
      verificationFailed: verificationFailed,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autoTimeout,
    );
  }

  Future<void> signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      print('User authenticated: ${userCredential.user?.uid}');
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                verifyPhone();
              },
              child: Text('Verify Phone'),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Verification Code',
              ),
              onChanged: (value) {
                setState(() {
                  smsCode = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                signInWithPhoneNumber();
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
