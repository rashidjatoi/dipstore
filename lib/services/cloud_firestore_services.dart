import 'package:dipstore/services/firebase_services_constants.dart';
import 'package:dipstore/utils/utils.dart';

class CloundFirestoreServices {
  void storeUsersDataNameEmailAdressPassword({
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
