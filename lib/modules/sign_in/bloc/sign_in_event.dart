part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInClickEvent extends SignInEvent {
  final String email;
  final String pass;

  SignInClickEvent({required this.email, required this.pass});
}

class EmailChangeEvent extends SignInEvent {
  final String email;

  EmailChangeEvent({required this.email});
}

class PassChangeEvent extends SignInEvent {
  final String pass;

  PassChangeEvent({required this.pass});
}
