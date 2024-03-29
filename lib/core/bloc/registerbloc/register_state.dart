part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSucceed extends RegisterState {
  final UserModel? user;
  RegisterSucceed({required this.user});
}

class RegisterFailed extends RegisterState {
  final message;
  RegisterFailed({required this.message});
  List<Object> get props => [message];
}
