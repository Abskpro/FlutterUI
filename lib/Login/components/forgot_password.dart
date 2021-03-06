import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeroday/Components/text_field_container.dart';
import 'package:zeroday/bloc/loginBloc/login_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zeroday/bloc/loginBloc/login_event.dart';
import 'package:zeroday/bloc/loginBloc/login_state.dart';
import 'package:zeroday/bloc/resetBloc/reset_bloc.dart';
import 'package:zeroday/bloc/resetBloc/reset_event.dart';
import 'package:zeroday/bloc/resetBloc/reset_state.dart';
import 'package:zeroday/repositories/user_repository.dart';

class ForgotPassword extends StatefulWidget {
  UserRepository userRepository;
  ForgotPassword({this.userRepository});
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email;
  ResetBloc resetBloc;

  void initState() {
    super.initState();
    resetBloc = ResetBloc(userRepository: widget.userRepository);
  }

  showAlertDialog(BuildContext context){
    AlertDialog alert = AlertDialog(
        content: new Row(
          children: [
            CircularProgressIndicator(),
            Container(margin:EdgeInsets.only(left:5),child:Text("Loading"))
          ],
        )
    );
    showDialog(barrierDismissible: false, context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider<ResetBloc>(
      create: (BuildContext context) =>resetBloc,
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body:BlocConsumer<ResetBloc, ResetState>(
          listener: (context,state){
            print("state has changed $state");
            if(state is PasswordResetEmailSentState){
              Navigator.pop(context);
              Navigator.pop(context);
              Fluttertoast.showToast(
                msg: "Email reset link has been sent to your mail",
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 18.0,
              );
            }
            if(state is PasswordResetLoadingState){
              showAlertDialog(context);
            }
            if(state is PasswordResetEmailFailedState){
              print("this is the reset stage ${state.message}");
              Navigator.pop(context);
              List<String> part = state.message.split(' ');
              part.remove('Exception:');
              String errorMessage = part.join(' ');
              Fluttertoast.showToast(
                msg: errorMessage,
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 18.0,
              );
            }
          },
          builder:(context,state){
           return Center(
             child: Container(
               alignment: Alignment.center,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     'Enter Your Email ',
                     style: TextStyle(fontSize: 30, color: Colors.white),
                   ),
                   TextFieldContainer(
                     child: TextFormField(
                       style: TextStyle(color: Colors.black),
                       onChanged: (value) => email = value,
                       decoration: InputDecoration(
                           border: InputBorder.none,
                           labelText: 'Email',
                           icon: Icon(Icons.mail, color: Colors.white)),
                     ),
                   ),
                   Container(
                     width: size.width * 0.3,
                     height: 50,
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(29),
                       child: RaisedButton(
                         onPressed: () {
                           print(email);
                          resetBloc
                               .add(PasswordResetPressed(email: email.toString()));
                         },
                         padding: EdgeInsets.all(10),
                         child: Text("RESET"),
                       ),
                     ),
                   )
                 ],
               ),
             ),
           );
          }
          // child: Center(
          //   child: Container(
          //     alignment: Alignment.center,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text(
          //           'Enter Your Email ',
          //           style: TextStyle(fontSize: 30, color: Colors.white),
          //         ),
          //         TextFieldContainer(
          //           child: TextFormField(
          //             style: TextStyle(color: Colors.black),
          //             onChanged: (value) => email = value,
          //             decoration: InputDecoration(
          //                 border: InputBorder.none,
          //                 labelText: 'Email',
          //                 icon: Icon(Icons.mail, color: Colors.white)),
          //           ),
          //         ),
          //         Container(
          //           width: size.width * 0.3,
          //           height: 50,
          //           child: ClipRRect(
          //             borderRadius: BorderRadius.circular(29),
          //             child: RaisedButton(
          //               onPressed: () {
          //                 print(email);
          //                 loginBloc
          //                     .add(PasswordResetPressed(email: email.toString()));
          //                 Fluttertoast.showToast(
          //                   msg: "Email reset link has been sent to your mail",
          //                   toastLength: Toast.LENGTH_SHORT,
          //                   timeInSecForIosWeb: 2,
          //                   backgroundColor: Colors.red,
          //                   textColor: Colors.white,
          //                   fontSize: 18.0,
          //                 );
          //                 Navigator.pop(context);
          //               },
          //               padding: EdgeInsets.all(10),
          //               child: Text("RESET"),
          //             ),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
