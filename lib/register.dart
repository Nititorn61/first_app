import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          verticalDirection: VerticalDirection.up,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 130,
              height: 120,
              color: Colors.red,
              child: Center(child: Text('1')),
            ),
            Container(
              width: 130,
              height: 120,
              color: Colors.green,
              child: Center(child: Text('2')),
            ),
            Container(
              width: 130,
              height: 120,
              color: Colors.blue,
              child: Center(child: Text('3')),
            ),
          ],
        )),
      ),
    );
  }
}
