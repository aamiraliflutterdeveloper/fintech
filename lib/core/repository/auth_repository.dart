import 'package:fintech_app/utils/helpers/exception_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final _auth = FirebaseAuth.instance;
  String verificationId = '';

  Stream<User?> get currentUserStream => _auth.authStateChanges();

  Future<bool> verifyPhone(String smsCode) async {
    print('VerificationId is $verificationId');
    print('sms code is $smsCode');
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      print(smsCode);
      print("this is sms code ..");
      var data = await FirebaseAuth.instance.signInWithCredential(credential);
      print(data);

      print("this is i am printing the values from firebnase method ");

      return true;

      //Get.find<AuthService>().user.value.verifiedPhone = true;
    } on FirebaseAuthException catch (e) {
      throw ExceptionHandler.firebaseAuthException(e);
      return false;
    }
  }

  Future<bool> sendCodeToPhone(String phoneNumber) async {
    print('Phone number is $phoneNumber');
    bool response = false;
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      print('PhoneCodeAutoRetrievalTimeout VerificationId is $verId');
    };
    final PhoneCodeSent smsCodeSent = (String verId, [int? forceCodeResent]) {
      print('PhoneCodeSent VerificationId is $verId');
      response = true;
      verificationId = verId;
    };
    final PhoneVerificationCompleted _verifiedSuccess =
        (AuthCredential auth) async {
      response = true;
    };
    final PhoneVerificationFailed _verifyFailed = (FirebaseAuthException e) {
      response = false;
      throw Exception(e.message);
    };
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(minutes: 2),
      verificationCompleted: _verifiedSuccess,
      verificationFailed: _verifyFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrieve,
    );
    return response;
  }

  void logOut() {
    _auth.signOut();
    _auth.authStateChanges();
  }
}
