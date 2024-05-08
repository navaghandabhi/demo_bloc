import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/post_model.dart';

Future<List<Posts>> fetchPosts() async {
  try{
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    List<Posts> postList = postsFromJson(response.body);
    return postList;
  }catch(error){
    log("fetchPosts error : $error");
    return [];
  }

}
