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

  Future<bool> isUsernameDuplicate(String username) async {
    try {
      var snapshot = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .get();

      if (snapshot.docs.isEmpty) {
        return false;
      }
      return true;
      {}
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}

// Function สำหรับเพิ่มข้อมูลผู้ใช้ใหม่ลงใน Firestore
Future<void> addUserToFirestore(String username, String password,
    String firstname, String lastname, String phonenumber) async {
  await FirebaseFirestore.instance.collection('users').add({
    'username': username,
    'password': password,
    'firstName': firstname,
    'lastName': lastname,
    'phoneNumber': phonenumber
  });
}
