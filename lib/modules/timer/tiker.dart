class Ticker {
  const Ticker();

  Stream<int> tick({required int duration}){
    return Stream.periodic(const Duration(seconds: 1),(computationCount) => duration - computationCount -1,)/*.take(duration)*/;
  }

}