import 'dart:js';
import 'dart:js_interop';

import 'package:compproject/model/listofloggedinuser.dart';
import 'package:compproject/model/user.dart';
import 'package:compproject/mybutton.dart';
import 'package:compproject/screentwo.dart';
import 'package:compproject/txtfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const List<String> socilaList = [
  'FaceBook',
  'Instagram',
  'Organic',
  ' Friend',
  'Google'
];

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LoggedInUser(),
      ),
    ],
    child: const MaterialApp(
      home: HomeScreen(),
    ),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String socialac = socilaList.first;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  void signInUser() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen1'),
      ),
      body: Consumer<LoggedInUser>(
        builder: (context, obj, child) => Column(
          children: [
            MyTxt(
                controller: userNameController,
                obscureText: false,
                hintText: 'username '),
            const SizedBox(
              height: 20,
            ),
            MyTxt(
                controller: passwordController,
                obscureText: true,
                hintText: 'Password'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(' Select Social '),
                DropdownButton<String>(
                  items:
                      socilaList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: socialac,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) => setState(
                    () {
                      socialac = value ?? socialac;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    String email = userNameController.text.trim();
                    String pass = passwordController.text.trim();
                    if (email.isNotEmpty && pass.isNotEmpty) {
                      setState(() {
                        userNameController.text = '';
                        passwordController.text = '';
                        obj.addToUser(User(email: email, socialAcc: socialac));
                      });
                    }
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScreenTwo()));
                },
                child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
