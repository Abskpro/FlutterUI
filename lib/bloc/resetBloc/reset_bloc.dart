import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:zeroday/bloc/resetBloc/reset_event.dart';
import 'package:zeroday/bloc/resetBloc/reset_state.dart';
import 'package:zeroday/repositories/user_repository.dart';

class ResetBloc extends Bloc<ResetEvent, ResetState> {
  UserRepository userRepository;

  ResetBloc({@required UserRepository userRepository}) : super(null) {
    this.userRepository = userRepository;
  }

  @override
  ResetState get initialState => PasswordResetState();

  @override
  Stream<ResetState> mapEventToState(ResetEvent event) async* {
    if (event is PasswordResetPressed) {
      yield PasswordResetLoadingState();
      try {
        var foo = await userRepository.sendPasswordResetEmail(event.email);
        yield PasswordResetEmailSentState();
      } catch (e) {
        // print("opps somthing happen ${e.code}");
        yield PasswordResetEmailFailedState(e.toString());
      }
    }
  }
}
