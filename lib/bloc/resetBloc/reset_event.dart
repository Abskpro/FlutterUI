import 'package:equatable/equatable.dart';

abstract class ResetEvent extends Equatable {}

class PasswordResetPressed extends ResetEvent{
  String email;
  PasswordResetPressed({this.email});

  @override
  List<Object> get props => throw UnimplementedError();
}
