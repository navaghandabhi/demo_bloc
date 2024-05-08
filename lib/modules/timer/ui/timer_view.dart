import 'package:delo_bloc/modules/timer/bloc/timer_bloc.dart';
import 'package:delo_bloc/modules/timer/tiker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerView extends StatelessWidget {
  TimerView({super.key});

  final TimerBloc timerBloc = TimerBloc(ticker: const Ticker());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => timerBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Timer"),
        ),
        body: Center(child: BlocBuilder<TimerBloc, TimerState>(
          builder: (context, state) {
            if (state is TimerCompleteState) {
              return const Text("Completed");
            } else if (state is TimerRunningState || state is TimerPauseState) {
              return Text("${state.duration}");
            } else if (state is TimerStopState) {
              return const Text("Timer Stopped Please Start Timer");
            } else {
              return const Text("Please Start Timer");
            }
          },
        )),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BlocBuilder<TimerBloc, TimerState>(
              builder: (context, state) {
                return FloatingActionButton(
                  onPressed: () {
                    if (timerBloc.countSubscription == null || state.duration <= 0) {
                      timerBloc.add(TimerStartEvent(duration: 60));
                    } else {
                      if (timerBloc.countSubscription!.isPaused) {
                        timerBloc.add(TimerStartEvent(duration: state.duration));
                      } else {
                        timerBloc.add(TimerPauseEvent(duration: state.duration));
                      }
                    }
                  },
                  tooltip: 'Start',
                  child: Icon(timerBloc.countSubscription == null
                      ? Icons.play_arrow
                      : timerBloc.countSubscription!.isPaused || state is TimerCompleteState || state is TimerStopState
                          ? Icons.play_arrow
                          : Icons.pause),
                );
              },
            ),
            const SizedBox(width: 8),
            FloatingActionButton(
              onPressed: () => timerBloc.add(TimerStopEvent()),
              tooltip: 'Stop',
              child: const Icon(Icons.stop),
            ),
            const SizedBox(width: 8),
            FloatingActionButton(
              onPressed: () => timerBloc.add(TimerRestartEvent(duration: 60)),
              tooltip: 'Restart',
              child: const Icon(Icons.restart_alt),
            ),
          ],
        ),
      ),
    );
  }
}
