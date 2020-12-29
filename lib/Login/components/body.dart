import 'package:flutter/material.dart';
import 'package:zeroday/Components/email_input.dart';
import 'package:zeroday/Components/password_input.dart';
import 'package:zeroday/Components/rounded_button.dart';
import 'package:zeroday/Components/social_media_button.dart';
import 'package:zeroday/Login/components/background.dart';
import 'package:zeroday/Login/components/social_media.dart';
import 'package:zeroday/Signup/signup_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  TextEditingController emailController;
  TextEditingController passwordController;

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
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
            child: Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Form(
        key: formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(height: 10),
            EmailInput(
              controller: emailController,
              validate: validateEmail,
              onChanged: onChanged,
            ),
            PasswordInput(
              text: "Password",
              controller: passwordController,
              validate: validatePassword,
              onChanged: onChanged,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text("Forgot Password ?"),
            ),
            RoundedButton(
              text: "LOG IN",
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text("Or connect using"),
            SocialLink(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ?"),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignUpScreen();
                    }));
                  },
                  child: Text('Sign Up'),
                  //  color: Colors.blueAccent,
                  textColor: Colors.blue,
                )
              ],
            )
          ],
        ),
      ),
    )));
  }
}
