import 'package:delo_bloc/modules/home/ui/home_view.dart';
import 'package:delo_bloc/modules/timer/tiker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/home/bloc/home_bloc.dart';
import 'modules/posts/bloc/posts_bloc.dart';
import 'modules/timer/bloc/timer_bloc.dart';

class MyBlocApp extends StatelessWidget {
  const MyBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(),
        ),
        BlocProvider<TimerBloc>(
          create: (BuildContext context) => TimerBloc(ticker: const Ticker()),
        ),
        BlocProvider<PostsBloc>(
          create: (BuildContext context) => PostsBloc(),
        ),
      ],
      child: HomeView(),
    );
  }
}
