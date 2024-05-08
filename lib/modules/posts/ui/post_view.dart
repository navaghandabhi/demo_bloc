import 'package:delo_bloc/modules/posts/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/post_model.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final PostsBloc postsBloc = PostsBloc();

  @override
  void initState() {
    super.initState();
    postsBloc.add(FetchPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts"), backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: BlocProvider(
        create: (context) => postsBloc,
        child: BlocBuilder<PostsBloc, PostsState>(
          bloc: postsBloc,
          builder: (context, state) {
            switch (state.runtimeType) {
              case PostsListState:
                final currentState = state as PostsListState;
                return ListView.builder(
                  itemCount: currentState.postList.length,
                  itemBuilder: (context, index) {
                    Posts post = currentState.postList[index];
                    return Card(
                        child: ListTile(
                      title: Text(post.title ?? ""),
                      subtitle: Text(post.body ?? ""),
                    ));
                  },
                );
              case PostLoadingState:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return SizedBox(child: Text("default"));
            }
          },
        ),
      ),
    );
  }
}
