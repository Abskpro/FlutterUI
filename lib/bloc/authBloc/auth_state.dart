import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {
  @override
  List<Object> get props => null;
}

class AuthenticatedState extends AuthState {
  User user;

  AuthenticatedState(@required this.user);

  @override
  List<Object> get props => null;
}

class UnauthenticatedState extends AuthState {
  @override
  List<Object> get props => null;
}
