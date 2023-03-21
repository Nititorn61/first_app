import 'package:flutter/material.dart';
import './login2.dart';
import './register2.dart';
import './service/api.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // แสดงพื้นหลังเต็มหน้าจอ
      appBar: AppBar(
        title: Text('ForgotPassword'),
        centerTitle: true,
        backgroundColor: Colors.blue, // กำหนดสีเป็นโปร่งใส
        elevation: 0,
        brightness: Brightness.dark, // ให้เนื้อหาที่อยู่ใน AppBar เป็นสีขาว
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/images/background_login.jpg"),
              fit: BoxFit.cover,
              opacity: 0.6,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                PhoneBox(hintText: 'เบอร์โทรศัพท์'),
                SizedBox(height: 20),
                UsernameBox(hintText: 'Username'),
                SizedBox(height: 20),
                ForgotpasswordBotton(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }),
                        );
                      },
                      child: Text("Login"),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return SignUpPage();
                          }),
                        );
                      },
                      child: Text("Sign Up"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
