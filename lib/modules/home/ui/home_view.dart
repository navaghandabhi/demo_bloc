import 'package:delo_bloc/modules/home/bloc/home_bloc.dart';
import 'package:delo_bloc/modules/home/ui/e_commerce.dart';
import 'package:delo_bloc/modules/home/ui/url%20test.dart';
import 'package:delo_bloc/modules/posts/ui/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibration/vibration.dart';

import '../../internet/internet_cubit.dart';
import '../../sign_in/ui/sign_in_view.dart';
import '../../timer/ui/timer_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => homeBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Bloc"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ECommerceView()));
                },
                child: const Text("E- commerce")),
            const SizedBox(height: 8),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const UrlTest()));
                },
                child: const Text("URL TEST")),
            BlocProvider(
              create: (context) => InternetCubit(),
              child: BlocListener<InternetCubit, InternetState>(
                listener: (context, state) {
                  if (state == InternetState.connected) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Internet Connected"),
                      backgroundColor: Colors.green,
                    ));
                  } else if (state == InternetState.notConnected) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Internet Not Connected"),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: BlocBuilder<HomeBloc, HomeState>(
                  bloc: homeBloc,
                  builder: (context, state) {
                    if (state is HomeInitialState) {
                      return Center(
                        child: Text(
                          'Count: ${state.count}',
                          style: const TextStyle(fontSize: 24),
                        ),
                      );
                    } else if (state is MakeStringState) {
                      return Center(
                        child: Text(
                          'Name: ${state.name}',
                          style: const TextStyle(fontSize: 24),
                        ),
                      );
                    }
                    return Center(
                      child: Text(
                        'Number Count: ${state.counter}',
                        style: const TextStyle(fontSize: 24),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () async {
                    if (await Vibration.hasVibrator() ?? false) {
                      Vibration.vibrate(duration: 1000, amplitude: 1);
                    } else {
                      print("Not available vibration");
                    }
                  },
                  tooltip: 'vibration',
                  child: const Icon(Icons.vibration),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    if (await Vibration.hasVibrator() ?? false) {
                      Vibration.vibrate(duration: 1000, amplitude: 250);
                    } else {
                      print("Not available vibration");
                    }
                  },
                  tooltip: 'vibration',
                  child: const Icon(Icons.vibration),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    if (await Vibration.hasVibrator() ?? false) {
                      Vibration.vibrate(duration: 40000, amplitude: 150, pattern: homeBloc.vibrateList(40000, [500, 1000]), intensities: [128]);
                    } else {
                      print("Not available vibration");
                    }
                  },
                  tooltip: 'vibration',
                  child: const Icon(Icons.vibration),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () async {
                    Vibration.cancel();
                  },
                  tooltip: 'stop vibration',
                  child: const Icon(Icons.stop),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignInView(),
                  )),
                  tooltip: 'Sign In',
                  child: const Icon(Icons.login),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () => homeBloc.add(IncrementEvent()),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () => homeBloc.add(ZeroEvent()),
                  tooltip: 'Zero',
                  child: const Icon(Icons.exposure_zero),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () => homeBloc.add(MakeStringEvent()),
                  tooltip: 'String',
                  child: const Icon(Icons.stream),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PostView(),
                  )),
                  tooltip: 'Api Demo',
                  child: const Icon(Icons.list),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TimerView(),
                  )),
                  tooltip: 'Timer',
                  child: const Icon(Icons.timer),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
