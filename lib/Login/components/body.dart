import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zeroday/Components/email_input.dart';
import 'package:zeroday/Components/password_input.dart';
import 'package:zeroday/Components/rounded_button.dart';
import 'package:zeroday/Components/social_media_button.dart';
import 'package:zeroday/Login/components/background.dart';
import 'package:zeroday/Login/components/social_media.dart';
import 'package:zeroday/Signup/signup_screen.dart';
import 'package:zeroday/services/auth.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";
  TextEditingController emailController;
  TextEditingController passwordController;

  final AuthService _auth = AuthService();

  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailController.addListener(_updateEmail);
    passwordController.addListener(_updatePassword);
  }

  void onChanged(type, value) {
    print(value);
    if (type == "email") {
      setState(() {
        email = value;
      });
    } else {
      setState(() {
        password = value;
      });
    }
  }

  _updateEmail() {
    print("updated");
    setState(() {
      email = emailController.text;
    });
  }

  _updatePassword() {
    print("updated");
    setState(() {
      password = passwordController.text;
    });
  }

  bool validateEmail() {
    // print("validating email");
    return email.isEmpty || email.length > 8;
  }

  bool validatePassword() {
    // print("validating password");
    return password.isEmpty || password.length > 8;
  }

  void validate() async {
    print("pressed");
    if (formkey.currentState.validate()) {
      print("Validated");
      dynamic result = await _auth.loginUserToApp(email, password);
      if (result == null) {
        setState(() {
          error = 'please supply a valid email';
        });
      }
    } else {
      print("not validated");
    }
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
              screen: "login",
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
              validateEmail: validateEmail,
              validatePassword: validatePassword,
              press: validate,
              text: "LOG IN",
              color: Colors.blue,
            ),
            SizedBox(height: 15),
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
            ),
            // SizedBox(height: 12),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            )
          ],
        ),
      ),
    )));
  }
}
