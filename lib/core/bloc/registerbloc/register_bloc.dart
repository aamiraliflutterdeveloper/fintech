import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fintech_app/core/models/user_model.dart';

import '../../data/repositories/userDataRepository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserDataRepository userdataRepository;
  RegisterBloc({required this.userdataRepository}) : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterLoading();
      try {
        UserModel? user = await userdataRepository.addUser(
            phoneNumber: event.phoneNumber,
            emailAddress: event.emailAddress,
            fullName: event.fullName,
            idNumber: event.idNumber,
            id: event.id,
            mpin: event.mpin);
        print("hahhah");
        yield RegisterSucceed(user: user);
        // }
      } catch (e) {
        yield RegisterFailed(message: e);
      }
    }
  }
}
