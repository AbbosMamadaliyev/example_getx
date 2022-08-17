import 'package:example_getx/example2_with_api/pages/example2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'example1/example1.dart';
import 'example2_with_api/services/di_service.dart';

void main() async {
  await DIService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Example2Page(),
    );
  }
}
