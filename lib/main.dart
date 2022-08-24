import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/view/find_pet_by_id.dart';

import 'view/select_by_status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FindPetById(),
    );
  }
}
