part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsListState extends PostsState {
  final List<Posts> postList ;

  PostsListState({required this.postList});
}
class PostLoadingState extends PostsState {
}

