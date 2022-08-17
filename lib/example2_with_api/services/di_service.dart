import 'package:example_getx/example2_with_api/controllers/controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DIService {
  static Future<void> init() async {
    Get.lazyPut<ApiController>(() => ApiController(), fenix: true);
  }
}
