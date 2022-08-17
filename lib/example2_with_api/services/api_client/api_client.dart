import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:example_getx/example2_with_api/model/post_model.dart';

class ApiClient {
  final uri = 'https://jsonplaceholder.typicode.com/posts';
  var dio = Dio();

  Future<List<PostModel>> getPosts() async {
    final response = await dio.get(uri);

    final dataList = response.data as List;
    final posts = dataList.map((e) => PostModel.fromMap(e)).toList();

    return posts;
  }

  Future<PostModel> getPostById(int id) async {
    final response = await dio.get('$uri/$id');

    final post = PostModel.fromMap(response.data);

    return post;
  }
}
