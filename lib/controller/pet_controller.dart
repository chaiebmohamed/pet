import 'package:get/get.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pet/model/pet.dart';
import 'package:pet/service/petservice.dart';
import 'package:image_picker/image_picker.dart';

class petController extends GetxController {
  TextEditingController id = TextEditingController();
  TextEditingController categoryId = TextEditingController();
  TextEditingController categoryName = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController tagsId = TextEditingController();
  TextEditingController tagsName = TextEditingController();
  TextEditingController Status = TextEditingController();
  var imageList = <String>[].obs;
  var taglist = <Category>[].obs;

  List urls = <String>[].obs;
  var selectedImagePath = ''.obs;

  var p = Pet().obs;

  void getImage(ImageSource imageSource) async {
    final pickedfile = await ImagePicker().getImage(source: imageSource);

    if (pickedfile != null) {
      imageList.add(pickedfile.path);
    } else {
      Get.snackbar('error', "no image selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  addTag(int x, String ch) {
    var y = Category(id: x, name: ch);

    taglist.add(y);
  }

  postPet(Pet pet) async {
    var response = await petService.postPet(pet);
    if (response != null) {
      p.value = pet;
      Get.snackbar('done', "pet added successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color.fromARGB(255, 0, 119, 255),
          colorText: Colors.white);
    } else {
      Get.snackbar('error', "there is something wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  updatePet(Pet pet) async {
    var response = await petService.putPet(pet);
    if (response != null) {
      p.value = pet;
      Get.snackbar('done', "pet added successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color.fromARGB(255, 0, 119, 255),
          colorText: Colors.white);
    } else {
      Get.snackbar('error', "there is something wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
