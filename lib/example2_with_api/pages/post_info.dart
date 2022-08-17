import 'package:example_getx/example2_with_api/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostInfoPage extends StatefulWidget {
  const PostInfoPage({Key? key}) : super(key: key);

  @override
  State<PostInfoPage> createState() => _PostInfoPageState();
}

class _PostInfoPageState extends State<PostInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('post info'),
      ),
      body: GetBuilder<ApiController>(builder: (apiController) {
        if (apiController.isLoadPostInfo) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (apiController.postModel == null) {
          return const Center(
            child: Text('No data, sorry!'),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'id: ${apiController.postModel!.id} ',
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.blue,
                ),
              ),
              Text(
                'title:  ${apiController.postModel!.title}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'body:  ${apiController.postModel!.body}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
