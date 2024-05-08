part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {}

class FetchPostsEvent extends PostsEvent{}
