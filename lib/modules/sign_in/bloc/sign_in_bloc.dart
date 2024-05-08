import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {});
    on<SignInClickEvent>((event, emit) {
      log("email ${event.email} , pass ${event.pass}");
      emit(SignInClickState(email: event.email, pass: event.pass));
      if (event.email == "") {
        emit(SignInFormNotValidate(error: "Enter Email"));
      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(event.email)) {
        emit(SignInFormNotValidate(error: "Enter valid Email"));
      } else if (event.pass == "") {
        emit(SignInFormNotValidate(error: "Enter Pass"));
      } else if (event.pass.length <= 6) {
        emit(SignInFormNotValidate(error: "Enter Strong Pass"));
      } else {
        emit(SignInSuccess());
        emit(SignInFormValidate());
      }
    });
    on<EmailChangeEvent>((event, emit) {
      if (event.email == "") {
        emit(SignInFormNotValidate(error: "Enter Email"));
      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(event.email)) {
        emit(SignInFormNotValidate(error: "Enter valid Email"));
      } else {
        emit(SignInFormValidate());
      }
    });
    on<PassChangeEvent>((event, emit) {
      if (event.pass == "") {
        emit(SignInFormNotValidate(error: "Enter Pass"));
      } else if (event.pass.length <= 6) {
        emit(SignInFormNotValidate(error: "Enter Strong Pass"));
      } else {
        emit(SignInFormValidate());
      }
    });
  }
}
