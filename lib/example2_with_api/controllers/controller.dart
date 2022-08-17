import 'package:example_getx/example2_with_api/model/post_model.dart';
import 'package:get/get.dart';

import '../services/api_client/api_client.dart';

class ApiController extends GetxController {
  final apiClient = ApiClient();
  List<PostModel> posts = [];
  PostModel? postModel;
  bool isLoadPostInfo = false;

  Future<void> getPosts() async {
    posts = await apiClient.getPosts();
    update();
  }

  Future<void> getPostById(int id) async {
    isLoadPostInfo = true;

    postModel = await apiClient.getPostById(id);
    isLoadPostInfo = false;
    update();
  }
}
