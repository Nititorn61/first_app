import 'package:first_app/forgotpassword2.dart';
import 'package:first_app/regisvehicle.dart';
import 'package:first_app/service/database.dart';
import 'package:flutter/material.dart';
import './register2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> login(String username, String password) async {
  try {
    // ค้นหาข้อมูลผู้ใช้จาก username ที่ใส่เข้ามา
    var snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .get();

    // ถ้าไม่พบผู้ใช้ หรือรหัสผ่านผิด ให้คืนค่า false
    if (snapshot.docs.isEmpty ||
        snapshot.docs[0].data()['password'] != password) {
      return false;
    }

    // ถ้าพบผู้ใช้ และรหัสผ่านตรงกัน ให้คืนค่า true
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Database database = Database();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/images/background_login.jpg"),
          fit: BoxFit.cover,
          opacity: 0.6,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('lib/images/Logo03.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              controller: _usernameController,
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
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
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
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)))),
            onPressed: () async {
              if (_usernameController.text.isEmpty ||
                  _passwordController.text.isEmpty) {
                // แสดงข้อความเตือนเมื่อช่อง username หรือ password ว่างเปล่า
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                    duration: Duration(seconds: 3),
                  ),
                );
              } else {
                // เรียกใช้งานฟังก์ชัน login และรับค่าผลลัพธ์
                bool success = await database.login(
                    _usernameController.text, _passwordController.text);
                if (success) {
                  // สร้างหน้าที่จะไปหลังจาก Login สำเร็จ
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUpPage()));
                } else {
                  // แสดงข้อความเตือนเมื่อ Login ไม่สำเร็จ
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('ชื่อผู้ใช้หรือรหัสผ่านผิด'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              }
            },
            child: Text('Login'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ForgotPasswordPage();
                  }));
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(width: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignUpPage();
                  }));
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(width: 20.0),
            ],
          ),
          SizedBox(height: 30.0),
          GestureDetector(
            onTap: () {
              // ระบบการ Login ด้วย Google
            },
            child: Container(
              width: 50, // กำหนดขนาดกว้างของปุ่ม
              height: 50, // กำหนดขนาดสูงของปุ่ม
              decoration: BoxDecoration(
                shape: BoxShape.circle, // กำหนดให้เป็นวงกลม
                image: DecorationImage(
                  image: AssetImage(
                      'lib/images/googlelogin.jpg'), // ใส่รูปภาพจากไฟล์
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
