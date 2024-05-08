part of 'timer_bloc.dart';

@immutable
abstract class TimerEvent {}

class TimerStartEvent extends TimerEvent{
  final int duration;

  TimerStartEvent({required this.duration});
}
class TimerStopEvent extends TimerEvent{}
class TimerPauseEvent extends TimerEvent{
  final int duration;

  TimerPauseEvent({required this.duration});
}
class TimerResumeEvent extends TimerEvent{}
class TimerRestartEvent extends TimerEvent{
  final int duration;

  TimerRestartEvent({required this.duration});
}
class TimerRunningEvent extends TimerEvent{
  final int duration;

  TimerRunningEvent({required this.duration});
}
