import 'package:first_app/forgotpassword2.dart';
import 'package:flutter/material.dart';
import './register2.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            onPressed: () {
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
                // ระบบ Login
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
