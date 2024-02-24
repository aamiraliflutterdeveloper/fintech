part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object?> get props => [];
}

class RegisterButtonPressed extends RegisterEvent {
  String id, phoneNumber, fullName, emailAddress, idNumber, mpin;
  RegisterButtonPressed(
      {required this.id,
      required this.phoneNumber,
      required this.fullName,
      required this.emailAddress,
      required this.idNumber,
      required this.mpin});
}
