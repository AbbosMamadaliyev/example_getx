import 'package:example_getx/example1/controller.dart';
import 'package:example_getx/example2_with_api/controllers/controller.dart';
import 'package:example_getx/example2_with_api/pages/post_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Example2Page extends StatefulWidget {
  const Example2Page({Key? key}) : super(key: key);

  @override
  State<Example2Page> createState() => _Example2PageState();
}

class _Example2PageState extends State<Example2Page> {
  @override
  initState() {
    super.initState();
    Get.find<ApiController>().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: GetBuilder<ApiController>(
          init: ApiController(),
          builder: (apiController) {
            if (apiController.posts.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: apiController.posts.length,
              itemBuilder: (context, index) {
                final post = apiController.posts[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => const PostInfoPage());
                    Get.find<ApiController>().getPostById(post.id);
                  },
                  child: Text(
                    'data ${index + 1}: ${post.title}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
            );
          }),
    );
  }
}

class OtherPage extends StatelessWidget {
  OtherPage({Key? key}) : super(key: key);

  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page 2'),
      ),
      body: Center(
        child: Text(
          controller.count.toString(),
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
