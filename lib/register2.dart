import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './service/api.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/images/background_login.jpg"),
                fit: BoxFit.fill,
                opacity: 0.6,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      AssetImage('lib/images/profile.png'),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () async {
                                    final pickedFile = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);

                                    if (pickedFile != null) {
                                      // Do something with the picked file
                                      File file = File(pickedFile.path);
                                      // รูปภาพที่เลือกจะอยู่ในตัวแปร file
                                    }
                                  },
                                  child: Text('Upload'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                UsernameBox(hintText: 'username'),
                                SizedBox(
                                  height: 10,
                                ),
                                PasswordBox(hintText: 'Enter your password'),
                                Text('ข้อมูลส่วนตัว',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    )),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                        child:
                                            FirstnameBox(hintText: 'ชื่อจริง')),
                                    SizedBox(width: 10),
                                    Expanded(
                                        child:
                                            LastnameBox(hintText: 'นามสกุล')),
                                  ],
                                ),
                                SizedBox(height: 10),
                                PhoneBox(hintText: 'เบอร์โทรศัพท์'),
                                SizedBox(height: 20),
                                SignupBotton(),
                              ]),
                        ))))));
  }
}
