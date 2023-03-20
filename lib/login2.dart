import 'package:first_app/forgotpassword2.dart';
import 'package:flutter/material.dart';
import './register2.dart';

import './service/api.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      child: Container(
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
              child: UsernameBox(hintText: 'Enter your username'),
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: PasswordBox(hintText: 'Enter your password'),
            ),
            SizedBox(height: 30.0),
            LoginBotton(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
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
      ),
    ));
  }
}
