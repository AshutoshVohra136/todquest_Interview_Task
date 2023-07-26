import 'package:compproject/model/listofloggedinuser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<LoggedInUser>(
        builder: (context, obj, child) => Container(
          child: obj.loggedInUsers.isEmpty
              ? const Text('No Logged in User Found')
              : ListView.builder(
                  itemCount: obj.loggedInUsers.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      obj.loggedInUsers[index].email,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
