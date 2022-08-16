import 'package:example_getx/example2_with_api/api_client/api_client.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  final apiClient = ApiClient();

  Future<void> getPosts() async {
    await apiClient.getPosts();
  }
}
