import 'package:get/get.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class petController extends GetxController {
  TextEditingController id = TextEditingController();
  TextEditingController categoryId = TextEditingController();
  TextEditingController categoryName = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController tagsId = TextEditingController();
  TextEditingController tagsName = TextEditingController();
  var Status = "".obs;
  List urls = <String>[].obs;
}
