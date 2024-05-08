part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInClickState extends SignInState {
  final String email;
  final String pass;

  SignInClickState({required this.email, required this.pass});
}

class SignInSuccess extends SignInState{}
class SignInFormValidate extends SignInState{}
class SignInFormNotValidate extends SignInState{
  final String error;

  SignInFormNotValidate({required this.error});
}
