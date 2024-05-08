import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../tiker.dart';

part 'timer_event.dart';

part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  static const int _duration = 60;
  final Ticker _ticker;
  StreamSubscription<int>? countSubscription;

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitialState(duration: _duration)) {
    on<TimerEvent>(_timerEvent);
    on<TimerStartEvent>(_timerStartEvent);
    on<TimerRunningEvent>(_timerRunningEvent);
    on<TimerPauseEvent>(_timerPauseEvent);
    on<TimerStopEvent>(_timerStopEvent);
    on<TimerRestartEvent>(_timerRestartEvent);
  }

  @override
  Future<void> close() {
    countSubscription?.cancel();
    return super.close();
  }



  FutureOr<void> _timerEvent(TimerEvent event, Emitter<TimerState> emit) {
    ///
  }

  FutureOr<void> _timerStartEvent(TimerStartEvent event, Emitter<TimerState> emit) {
    try {
      log("event.duration : ${event.duration}");
      countSubscription?.cancel();
      countSubscription = _ticker.tick(duration: event.duration).listen((duration) {
        log("duration : $duration");
        add(TimerRunningEvent(duration: duration));
      });
    } catch (error) {
      log("_timerStartEvent error : $error");
    }
  }

  FutureOr<void> _timerRunningEvent(TimerRunningEvent event, Emitter<TimerState> emit) {
    if (event.duration > 0) {
      emit(TimerRunningState(duration: event.duration));
    } else {
      countSubscription?.cancel();
      countSubscription = null;
      emit(const TimerCompleteState(duration: 0));
    }
  }

  FutureOr<void> _timerPauseEvent(TimerPauseEvent event, Emitter<TimerState> emit) {
    emit(TimerPauseState(duration: state.duration));
    countSubscription?.pause();
  }

  FutureOr<void> _timerStopEvent(TimerStopEvent event, Emitter<TimerState> emit) {
    countSubscription?.cancel();
    countSubscription = null;
    emit(const TimerStopState(duration: 0));
  }

  FutureOr<void> _timerRestartEvent(TimerRestartEvent event, Emitter<TimerState> emit) {
    add(TimerStartEvent(duration: event.duration));
  }


}
