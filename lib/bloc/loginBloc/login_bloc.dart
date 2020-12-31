import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zeroday/bloc/loginBloc/login_event.dart';
import 'package:zeroday/bloc/loginBloc/login_state.dart';
import 'package:zeroday/repositories/user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;

  LoginBloc({@required UserRepository userRepository}) : super(null) {
    this.userRepository = userRepository;
  }

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoadingState();
      try {
        var user = await userRepository.signInUser(event.email, event.password);
        yield LoginSuccessState(user);
      } catch (e) {
        yield LoginFailState(e.toString());
      }
    } else if (event is PasswordResetPressed) {
      try {
        var foo = userRepository.sendPasswordResetEmail(event.email);
        yield ResetEmailSentState();
      } catch (e) {
        print(e);
      }
    }
  }
}
