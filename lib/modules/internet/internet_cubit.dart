import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  InternetCubit() : super(InternetState.connected){
    connectivitySubscription = _connectivity.onConnectivityChanged.listen((event) {
      if(event == ConnectivityResult.mobile || event == ConnectivityResult.wifi){
        // log("connected");
        emit(InternetState.connected);
      }else{
        // log("Not connected");
        emit(InternetState.notConnected);
      }
    });
  }
@override
  Future<void> close() {
  connectivitySubscription?.cancel();
  return super.close();
  }
}
