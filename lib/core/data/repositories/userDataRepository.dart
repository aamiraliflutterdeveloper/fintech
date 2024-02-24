import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

class UserDataRepository {
  UserModel? userModel;
  Future<UserModel?> addUser({
    required String id,
    required String phoneNumber,
    required String fullName,
    required String emailAddress,
    required String idNumber,
    required String mpin,
  }) async {
    Map<String, dynamic> userData = {
      "id": id,
      "phoneNumber": phoneNumber,
      "fullName": fullName,
      "emailAddress": emailAddress,
      "idNumber": idNumber,
      "mpin": mpin,
    };
    await FirebaseFirestore.instance
        .collection("users")
        .doc(phoneNumber)
        .set(userData)
        .catchError((e) {
      print(e.toString());
    });
    return null;
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> isLoggedIn() async {
    var firebaseUser = _auth.currentUser;
    if (firebaseUser == null) {
      return false;
    } else {
      print('User name ${firebaseUser.displayName}');
      print('User email ${firebaseUser.email}');
      print('User phone ${firebaseUser.phoneNumber}');
      String phoneNumber = '';
      if (firebaseUser.phoneNumber!.startsWith("+")) {
        phoneNumber = "" + firebaseUser.phoneNumber!.substring(1);
      }

      phoneNumber = firebaseUser.phoneNumber!.replaceFirst(RegExp('92'), '0');
      phoneNumber = phoneNumber.replaceFirst('+', '');
      print("User Phone is: $phoneNumber");
      var user = await fetchUser(phoneNumber);
      userModel = user;
      if (userModel == null) return false;
      return true;
    }
  }

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  fetchUser(String userId) {
    return userCollection.doc(userId).get().then((snapShot) {
      if (snapShot.data() == null) {
        return null;
      } else {
        return UserModel.fromJson(snapShot.data()! as Map<String, Object?>);
      }
    });
  }

  verifyLogin(String pinCode) async {
    var firebaseUser = _auth.currentUser;
    if (firebaseUser == null) {
      return false;
    } else {
      print('User name ${firebaseUser.displayName}');
      print('User email ${firebaseUser.email}');
      print('User phone ${firebaseUser.phoneNumber}');
      String phoneNumber = '';
      if (firebaseUser.phoneNumber!.startsWith("+")) {
        phoneNumber = "" + firebaseUser.phoneNumber!.substring(1);
      }
      phoneNumber = firebaseUser.phoneNumber!.replaceFirst(RegExp('92'), '0');
      phoneNumber = phoneNumber.replaceFirst('+', '');
      print("User Phone is: $phoneNumber");
      SharedPreferences share = await SharedPreferences.getInstance();
      share.setString('pin', phoneNumber);
      var user = await fetchUser(phoneNumber);
      return user;
    }
  }

  Future<bool> isAlreadyExists() async {
    var firebaseUser = _auth.currentUser;
    if (firebaseUser == null) {
      return false;
    } else {
      print('User name ${firebaseUser.displayName}');
      print('User email ${firebaseUser.email}');
      print('User phone ${firebaseUser.phoneNumber}');
      String phoneNumber = '';
      if (firebaseUser.phoneNumber!.startsWith("+")) {
        phoneNumber = "" + firebaseUser.phoneNumber!.substring(1);
      }
      phoneNumber = firebaseUser.phoneNumber!.replaceFirst(RegExp('92'), '0');
      phoneNumber = phoneNumber.replaceFirst('+', '');
      print("User Phone is: $phoneNumber");

      var myMapQuery = (await FirebaseFirestore.instance
          .collection("users")
          .where('phoneNumber', isEqualTo: phoneNumber));
      var querySnapshot = await myMapQuery.get();

      var user = await fetchUser(phoneNumber);
      var totalEquals = querySnapshot.docs.length;
      if (totalEquals == 0 && user == null) {
        return false;
      } else {
        userModel = user;
        return true;
      }

      if (user == null) {
        return false;
      } else {
        userModel = user;
        var totalEquals = querySnapshot.docs.length;
        if (totalEquals > 0) {
          return true;
        } else {
          return false;
        }
      }
    }
  }
}
