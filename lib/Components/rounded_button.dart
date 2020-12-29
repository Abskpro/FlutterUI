import 'package:flutter/material.dart';
import 'package:zeroday/Components/text_field_container.dart';

class RoundedButton extends StatefulWidget {
  final TextEditingController controller;
  final Function validate;
  final Function onChanged;
  final Color color, textColor;
  final String text;
  const RoundedButton(
      {Key key,
      this.controller,
      this.validate,
      this.onChanged,
      this.color,
      this.text,
      this.textColor});
  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.5,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: RaisedButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                child: Text(
                  widget.text,
                  style: TextStyle(color: widget.textColor),
                ))));
  }
}
