import 'package:flutter/material.dart';
import 'package:zeroday/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key key, this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 9),
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: size.width * 0.8,
        decoration: BoxDecoration(
            color: kPrimaryLightColor, borderRadius: BorderRadius.circular(29)),
        child: child);
  }
}
