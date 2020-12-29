import 'package:flutter/material.dart';
import 'package:zeroday/Components/email_input.dart';
import 'package:zeroday/Components/number_input.dart';
import 'package:zeroday/Components/password_input.dart';
import 'package:zeroday/Components/rounded_button.dart';
import 'package:zeroday/Signup/components/background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email = "";
  String password = "";
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController numberController;

  void onChanged() {
    print("asdf");
  }

  bool validateEmail() {
    return email.length > 8;
  }

  bool validatePassword() {
    return password.length > 8;
  }

  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Form(
          child: Column(
            children: [
              EmailInput(
                controller: emailController,
                validate: validateEmail,
                onChanged: onChanged,
              ),
              NumberInput(
                controller: numberController,
                validate: validateEmail,
                onChanged: onChanged,
              ),
              PasswordInput(
                text: "Password",
                controller: passwordController,
                validate: validatePassword,
                onChanged: onChanged,
              ),
              PasswordInput(
                text: "Confim Password",
                controller: passwordController,
                validate: validatePassword,
                onChanged: onChanged,
              ),
              SizedBox(
                height: 30,
              ),
              RoundedButton(
                text: "CREATE",
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
