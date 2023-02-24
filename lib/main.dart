import './login.dart';
import 'package:flutter/material.dart';
import './home_screen.dart';
import './register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      home: Login(),
    );
  }
}
