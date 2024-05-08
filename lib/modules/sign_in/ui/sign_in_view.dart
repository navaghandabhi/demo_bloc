import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/sign_in_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();

    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    SignInBloc signInBloc = SignInBloc();
    return Scaffold(
      appBar: AppBar(title: const Text("Sign In"), backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocProvider(
                  create: (context) => signInBloc,
                  child: BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      switch (state.runtimeType) {
                        case SignInFormNotValidate:
                          final currentState = state as SignInFormNotValidate;
                          return Text(currentState.error);
                        default :
                          return const SizedBox();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("Email")),
                  validator: (value) {
                    if (value == "") {
                      return "Enter Email";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    signInBloc.add(EmailChangeEvent(email: value));
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: passController,
                  decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("Password")),
                  validator: (value) {
                    if (value == "") {
                      return "Enter Password";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    signInBloc.add(PassChangeEvent(pass: value));
                  },
                ),
                const SizedBox(height: 8),
                BlocProvider(
                  create: (context) => signInBloc,
                  child: BlocConsumer<SignInBloc, SignInState>(
                    listener: (context, state) {
                      if (state is SignInSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                            "Login Success",
                          ),
                          backgroundColor: Colors.green,
                        ));
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () {
                            formKey.currentState?.validate();
                            // if (formKey.currentState!.validate()) {
                              BlocProvider.of<SignInBloc>(context).add(SignInClickEvent(email: emailController.text, pass: passController.text));
                              // context.read<SignInBloc>().add(SignInClickEvent(email: emailController.text,pass: passController.text));
                              // signInBloc.add(SignInClickEvent(email: emailController.text,pass: passController.text));
                              // formKey.currentState?.reset();
                            // }
                          },
                          child: const Text("Submit"));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
