import 'package:flutter/material.dart';
import 'package:zeroday/models/interns.dart';

class InternTile extends StatelessWidget {
  final Intern intern;
  InternTile({this.intern});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 6, 20, 6),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.brown,
            ),
            title: Text(intern.name),
            subtitle: Text('Is study in ${intern.university}'),
          ),
        ));
  }
}
