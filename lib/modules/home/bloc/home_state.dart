part of 'home_bloc.dart';

 class HomeState extends Equatable{
  final int counter;

  const HomeState({this.counter = 0});

  @override
  // TODO: implement props
  List<Object?> get props => [counter];
}


class HomeInitialState extends HomeState {
  final int count;

  const HomeInitialState({required this.count});

  @override
  // TODO: implement props
  List<Object?> get props => [count,super.counter];

}

class MakeStringState extends HomeState {
  final String name;

  MakeStringState({this.name = "hello"});

  @override
  // TODO: implement props
  List<Object?> get props => [name,super.counter];
}
