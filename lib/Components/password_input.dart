import 'package:flutter/material.dart';
import 'package:zeroday/Components/text_field_container.dart';
import 'package:zeroday/constants.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final Function validate;
  final Function onChanged;
  const PasswordInput({
    Key key,
    this.controller,
    this.validate,
    this.text,
    this.onChanged,
  });
  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
      controller: widget.controller,
      onChanged: (value) => widget.onChanged(value),
      decoration: InputDecoration(
        // errorText: widget.validate() ? null : "password must be 8 char",
        hintText: widget.text,
        prefixIcon: Icon(
          Icons.visibility,
          color: kPrimaryColor,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
