part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  final UserModel? user;
  LoginSuccessState({required this.user});
  @override
  List<Object?> get props => [user];
}

class LoginErrorState extends LoginState {
  final String message;
  LoginErrorState({required this.message});
  @override
  List<String> get props => [message];
}
