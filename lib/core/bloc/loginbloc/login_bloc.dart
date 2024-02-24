import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/userDataRepository.dart';
import '../../models/user_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserDataRepository userdataRepository;
  LoginBloc({required this.userdataRepository}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoadingState();
      try {
        UserModel? user = await userdataRepository.verifyLogin(event.pinCode);
        if (user!.mpin == event.pinCode) {
          yield LoginSuccessState(user: user);
        } else {
          print("hahhah");
          yield LoginErrorState(message: 'please Enter Correct Pin');
        }
      } catch (e) {
        yield LoginErrorState(message: 'please Enter Correct Pin');
      }
    }
  }
}
