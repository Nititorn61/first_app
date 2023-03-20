import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _phonenumberController = TextEditingController();

 String _validateUsername(String username) {
// Check if username is already taken
// If the username is taken, return "Username already taken". Otherwise, return null.
final doc = await FirebaseFirestore.instance.collection('users').doc(username).get();
if (doc.exists) {
  return "Username already taken";
}
return null;
 }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;
      final firstname = _firstnameController.text;
      final lastname = _lastnameController.text;
      final phonenumber = _phonenumberController.text;
      // ทำการตรวจสอบ username ใน Firebase ก่อน
        // Check if the username is already taken
  final doc = await FirebaseFirestore.instance.collection('users').doc(username).get();
  if (doc.exists) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Username already taken'),
        backgroundColor: Colors.red,
      ),
    );
  } else {
    // If the username is not taken, create a new user
    await FirebaseFirestore.instance.collection('users').doc(username).set({
      'password': password,
      'firstname': firstname,
      'lastname': lastname,
      'phonenumber': phonenumber,
    });

    // Show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('User created successfully'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
  }
  @override
Widget build(BuildContext context) {
  return Scaffold(
      extendBodyBehindAppBar: true, // แสดงพื้นหลังเต็มหน้าจอ
      appBar: AppBar(
        title: Text('สมัครสมาชิก'),
        centerTitle: true,
        backgroundColor: Colors.blue, // กำหนดสีเป็นโปร่งใส
        elevation: 0,
        brightness: Brightness.dark, // ให้เนื้อหาที่อยู่ใน AppBar เป็นสีขาว
      ),
      body: SafeArea(
        
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                    controller: _usernameController,
                  validator: (value) => value.isEmpty ? 'Please enter your username' : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  controller: _passwordController,
                  validator: (value) => value.isEmpty ? 'Please enter your password' : null,
                  obscureText: true, // ซ่อนตัวอักษร
                ),
                SizedBox(height: 10),
                Text(
                  'ข้อมูลส่วนตัว',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  )
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          labelText: 'ชื่อจริง',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          labelText: 'นามสกุล',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    labelText: 'เบอร์โทรศัพท์',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // ระบบการยืนยันการสมัคร
                  },
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
}

}

