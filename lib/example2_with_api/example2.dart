import 'package:example_getx/example1/controller.dart';
import 'package:example_getx/example2_with_api/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Example2Page extends StatelessWidget {
  const Example2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ApiController());

    c.getPosts();
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ds',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
                child: Text("Go to Other page"),
                onPressed: () => Get.to(() => OtherPage())),
          ],
        ),
      ),
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
