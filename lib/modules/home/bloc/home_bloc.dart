import 'dart:async';
import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((event, emit) {
      log("HOME EVENT");
    });
    on<ZeroEvent>(_makeZero);
    on<IncrementEvent>(_increment);
    on<MakeStringEvent>(_showString);
  }

  FutureOr<void> _makeZero(ZeroEvent event, Emitter<HomeState> emit) {
      emit(const HomeState(counter: 0));
      log("ZeroEvent counter : 0");

  }

  FutureOr<void> _increment(IncrementEvent event, Emitter<HomeState> emit) {
    int currentCount = (state).counter;

    emit(HomeInitialState(count: currentCount + 1));
    emit(HomeState(counter: currentCount + 1));
    log("IncrementEvent counter : $currentCount");
  }

  FutureOr<void> _showString(MakeStringEvent event, Emitter<HomeState> emit) {
    emit( MakeStringState());
  }

  List<int> vibrateList(int totalDuration, List<int> pattern) {
    List<int> result = [];
    int sum = 0;
    int patternIndex = 0;

    while (sum < totalDuration) {
      result.add(pattern[patternIndex]);
      sum += pattern[patternIndex];
      patternIndex = (patternIndex + 1) % pattern.length;
    }

    return result;
  }

}
