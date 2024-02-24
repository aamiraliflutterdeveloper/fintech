part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String pinCode;
  const LoginButtonPressed({required this.pinCode});
  @override
  List<Object?> get props => [pinCode];
}
