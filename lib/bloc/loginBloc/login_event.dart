import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginButtonPressed extends LoginEvent {
  String email, password;

  LoginButtonPressed({this.email, this.password});

  @override
  List<Object> get props => throw UnimplementedError();
}

class PasswordResetPressed extends LoginEvent {
  String email;
  PasswordResetPressed({this.email});

  @override
  List<Object> get props => throw UnimplementedError();
}
