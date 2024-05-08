part of 'timer_bloc.dart';

@immutable
abstract class TimerState {
  final int duration;

  const TimerState({required this.duration});
}

class TimerInitialState extends TimerState {
  const TimerInitialState({required super.duration});
}
class TimerStartState extends TimerState {
  const TimerStartState({required super.duration});
}
class TimerRunningState extends TimerState {
  const TimerRunningState({required super.duration});
}
class TimerStopState extends TimerState {
  const TimerStopState({required super.duration});
}
class TimerPauseState extends TimerState {
  const TimerPauseState({required super.duration});
}
class TimerCompleteState extends TimerState {
  const TimerCompleteState({required super.duration});
}
