import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> login(String username, String password) async {
    try {
      var snapshot = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .get();

      if (snapshot.docs.isEmpty ||
          snapshot.docs[0].data()['password'] != password) {
        return false;
      }

      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
