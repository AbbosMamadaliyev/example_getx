import 'package:dio/dio.dart';
import 'package:example_getx/example2_with_api/model/post_model.dart';

class ApiClient {
  final uri = 'https://jsonplaceholder.typicode.com/posts';
  var dio = Dio();

  Future<List<PostModel>> getPosts() async {
    final res = await dio.get(uri);

    print('dd: $res');

    List<PostModel> list = [];
    return list;
  }
}
