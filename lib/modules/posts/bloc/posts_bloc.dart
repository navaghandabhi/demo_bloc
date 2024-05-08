import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:delo_bloc/modules/posts/provider/api_service_provider.dart';
import 'package:meta/meta.dart';

import '../models/post_model.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsEvent>((event, emit) {});
    on<FetchPostsEvent>(_fetchPosts);
  }

  Future<FutureOr<void>> _fetchPosts(FetchPostsEvent event, Emitter<PostsState> emit) async {
    emit(PostLoadingState());
    List<Posts> postList = await fetchPosts();
    emit(PostsListState(postList: postList));
  }
}
