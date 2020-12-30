import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeroday/landing/intern_tiles.dart';
import 'package:zeroday/models/interns.dart';

class InternList extends StatefulWidget {
  @override
  _InternListState createState() => _InternListState();
}

class _InternListState extends State<InternList> {
  @override
  Widget build(BuildContext context) {
    final interns = Provider.of<List<Intern>>(context);
    // interns.forEach((intern) {
    //   print(intern.name);
    //   print(intern.age);
    //   print(intern.university);
    // });
    return ListView.builder(
      itemCount: interns.length,
      itemBuilder: (context, index) {
        return InternTile(intern: interns[index]);
      },
    );
  }
}
