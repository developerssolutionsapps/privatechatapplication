import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:private_chat/data/models/auth_user.dart';
import '../../core/constants/string_constants.dart';
import '../../core/exceptions/auth_exception_handler.dart';
import '../../core/exceptions/auth_exceptions.dart';
import '../../domain/models/user_model.dart';
import '../../domain/models/verification_status.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../firebase_options.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _auth = FirebaseAuth.instance;
  final storageRef = FirebaseStorage.instance.ref();
  final _firestore =
      FirebaseFirestore.instance.collection(StringsConstants.usersCollection);
  User? user;
  AuthRepositoryImpl() {
    final userFromFireBaseAuth = FirebaseAuth.instance.currentUser;
    if (userFromFireBaseAuth != null) {
      user = userFromFireBaseAuth;
    }
  }

  /// Invoke to signIn user with phone number.
  @override
  Future<VerificationStatus> signInWithPhone({
    required String phoneNumber,
    required void Function(String verificationId, [int? forceResendingToken])
        onCodeSent,
    required Function(PhoneAuthCredential credential) onVerificationCompleted,
    required Function(FirebaseAuthException e) onVerificationFailed,
    required Function(String verificationId) onCodeAutoRetrievalTimeout,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: onVerificationCompleted,
        verificationFailed: onVerificationFailed,
        codeSent: onCodeSent,
        codeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
      );
    } on FirebaseAuthException catch (e) {
      AuthExceptionManager.throwExceptionByErrorCode(e.code);
    }
    return VerificationStatus(
      phoneNumber: phoneNumber,
      isVerified: false,
      codeSent: false,
      resendToken: "",
    );
  }

  /// Invoke to verify otp.
  @override
  Future<String?> verifyOTP({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        return userCredential.user?.phoneNumber;
      } else {
        throw PhoneVerificationFailedException;
      }
    } on FirebaseAuthException catch (e) {
      AuthExceptionManager.throwExceptionByErrorCode(e.code);
    }
    return null;
  }

  /// invoke to get user data form firestore.
  @override
  Stream<UserModel> getReceiverUserData(String receiverUserId) {
    return _firestore.doc(receiverUserId).snapshots().map(
          (snapshot) => UserModel.fromMap(snapshot.data()!),
        );
  }

  @override
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;
    return AuthUser.fromFirebase(user);
  }

  @override
  User? get me => FirebaseAuth.instance.currentUser;

  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Future<void> logOut() async {
    try {
      _auth.signOut();
    } on FirebaseAuthException catch (e) {
      AuthExceptionManager.throwExceptionByErrorCode(e.code);
    }
  }
}
