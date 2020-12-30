import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zeroday/landing/intern_list.dart';
import 'package:zeroday/models/interns.dart';
import 'package:zeroday/services/database.dart';
import 'package:provider/provider.dart';
import 'package:zeroday/services/auth.dart';

class LandingPage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Intern>>.value(
      value: DatabaseService().interns,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Brew Crew"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text('logout'),
            )
          ],
        ),
        body: InternList(),
      ),
    );
  }
}
