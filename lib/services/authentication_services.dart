import 'package:dipstore/services/firebase_services_constants.dart';
import 'package:dipstore/utils/utils.dart';

class AuthenticationServices {
  // Create user account
  static Future signUpUser({
    required String name,
    required String address,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Utils.showToastMsaage("Account Created");
      });
    } catch (e) {
      Utils.showToastMsaage(e.toString());
    }
  }

  static Future loginMethod(email, password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Utils.showToastMsaage("Logged in");
      });
    } catch (e) {
      Utils.showToastMsaage(e.toString());
    }
  }

  // signout method
  static Future signoutMethod() async {
    try {
      await auth.signOut().then((value) {
        Utils.showToastMsaage("Sign out");
      });
    } catch (e) {
      Utils.showToastMsaage("Error: $e");
    }
  }

  void storeUsersData({
    required String name,
    required String address,
    required String email,
    required String password,
  }) async {
    final uid = auth.currentUser!.uid;
    await usersCollection.doc(uid).set(
      {
        "name": name,
        "address": address,
        "email": email,
        "password": password,
      },
    ).then((value) => Utils.showToastMsaage("User data added"));
  }
}
