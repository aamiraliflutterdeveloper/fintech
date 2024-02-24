import 'package:firebase_auth/firebase_auth.dart';

class ExceptionHandler {
  static firebaseAuthException(FirebaseAuthException exception) {
    print('This is exception code ${exception.code}');
    switch (exception.code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        throw 'This email already exist.';
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        throw 'Invalid email';
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        throw 'Your password is wrong.';
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        throw 'User with this email doesn\'t exist.';
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        throw 'User with this email has been disabled.';
      case "network-request-failed":
        throw 'No network found.';

      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        throw "Too many requests. Try again later.";

      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        throw "Signing in with Email and Password is not enabled.";
      case "invalid-verification-code":
        throw "Invalid Otp";
      case "invalid-phone-number":
        throw "Invalid Phone number";
      case "invalid-verification-id":
        throw "Code does not match, please send again";
      case "too-many-requests":
        throw "Code does not match, please send again";

      default:
        throw "An undefined Error happened.";
    }
  }
}
