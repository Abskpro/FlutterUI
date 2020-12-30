import 'package:flutter/material.dart';
import 'package:zeroday/Components/email_input.dart';
import 'package:zeroday/Components/number_input.dart';
import 'package:zeroday/Components/password_input.dart';
import 'package:zeroday/Components/rounded_button.dart';
import 'package:zeroday/Signup/components/background.dart';
import 'package:zeroday/services/auth.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String email = "";
  String password = "";
  String confirmPassword = "";
  String number = "";
  String error = '';

  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;
  TextEditingController numberController;

  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    numberController = TextEditingController();
    confirmPasswordController = TextEditingController();

    emailController.addListener(_updateEmail);
    passwordController.addListener(_updatePassword);
    confirmPasswordController.addListener(_updateConfirmPassword);
    numberController.addListener(_updateNumber);
  }

  void onChanged(type, value) {
    print(value);
    if (type == "email") {
      setState(() {
        email = value;
      });
    } else if (type == "password") {
      setState(() {
        password = value;
      });
    } else if (type == "number") {
      setState(() {
        number = value;
      });
    } else {
      setState(() {
        confirmPassword = value;
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

  _updateConfirmPassword() {
    print("updated");
    setState(() {
      confirmPassword = confirmPasswordController.text;
    });
  }

  _updateNumber() {
    print("updated");
    setState(() {
      number = numberController.text;
    });
  }

  bool validateEmail() {
    print("validating email");
    return email.isEmpty || email.length > 8;
  }

  bool validatePassword() {
    print("validating password");
    return password.isEmpty || password.length > 8;
  }

  bool validateNumber() {
    print("validating number");
    return number.isEmpty || number.length > 10;
  }

  bool validateConfirmPassword() {
    print("validating confirm password");
    return password.isEmpty || password == confirmPassword;
  }

  void validate() async {
    if (formkey.currentState.validate()) {
      print("Validated signup");
      dynamic result = await _auth.registerUserToApp(email, password);
      if (result == null) {
        setState(() {
          error = 'could not signin with credentials';
        });
      }
    } else {
      print("not validated");
    }
  }

  @override
  Widget build(BuildContext context) {
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
              EmailInput(
                controller: emailController,
                validate: validateEmail,
                onChanged: onChanged,
              ),
              NumberInput(
                controller: numberController,
                validate: validateNumber,
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
                screen: "Signup",
                controller: confirmPasswordController,
                validate: validatePassword,
                validateConfirm: validateConfirmPassword,
                onChanged: onChanged,
              ),
              SizedBox(
                height: 30,
              ),
              RoundedButton(
                validateEmail: validateEmail,
                validatePassword: validatePassword,
                press: validate,
                text: "CREATE",
                color: Colors.blue,
              ),
              SizedBox(height: 12),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
