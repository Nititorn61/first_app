import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import './home_screen.dart';

class Regster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_alert),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }),
            );
          },
        ),
        body: RegsterFul());
  }
}

class RegsterFul extends StatefulWidget {
  const RegsterFul({Key? key}) : super(key: key);

  @override
  State<RegsterFul> createState() => _RegsterFulState();
}

class _RegsterFulState extends State<RegsterFul> {
  TextEditingController firstNameRes = TextEditingController();
  TextEditingController lastNameRes = TextEditingController();
  TextEditingController userNameRes = TextEditingController();
  TextEditingController passWordRes = TextEditingController();
  TextEditingController emailRes = TextEditingController();
  TextEditingController phoneRes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Image(image: AssetImage('lib/images/profile.png')),
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'ลงทะเบียน',
                style: TextStyle(fontSize: 20),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: userNameRes,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: passWordRes,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'ข้อมูลส่วนตัว',
                style: TextStyle(fontSize: 20),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: firstNameRes,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ชื่อจริง',
              ),
              keyboardType: TextInputType.name,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: lastNameRes,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'นามสกุล',
              ),
              keyboardType: TextInputType.name,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: phoneRes,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'เบอรโทรศัพท์',
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
        ],
      ),
    );
  }
}
