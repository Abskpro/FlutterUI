import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ResetState{}

class PasswordResetState extends ResetState{
@override
List<Object> get props => throw UnimplementedError();
}

class PasswordResetLoadingState extends ResetState{
@override
List<Object> get props => throw UnimplementedError();
}

class PasswordResetEmailSentState extends ResetState{
@override
List<Object> get props => throw UnimplementedError();
}

class PasswordResetEmailFailedState extends ResetState{
String message;
PasswordResetEmailFailedState(@required this.message);
@override
List<Object> get props => null;
}

