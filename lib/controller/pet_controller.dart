import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pet/model/pet.dart';
import 'package:pet/service/petservice.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class PetController extends GetxController {
  TextEditingController id = TextEditingController();
  TextEditingController categoryId = TextEditingController();
  TextEditingController categoryName = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController tagsId = TextEditingController();
  TextEditingController tagsName = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController additionalMetadata = TextEditingController();
  var imageList = <String>[].obs;
  var taglist = <Category>[].obs;
  List<String> listStatus = ['available', 'pending', 'sold'];
  var selectedOptionList = <String>[].obs;

  var selectedoption = ''.obs;

  List urls = <String>[].obs;
  var selectedImagePath = ''.obs;

  var p = Pet().obs;

  void getImage(ImageSource imageSource) async {
    // ignore: deprecated_member_use
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

  void updateImage(ImageSource imageSource) async {
    // ignore: deprecated_member_use
    final pickedfile = await ImagePicker().getImage(source: imageSource);

    if (pickedfile != null) {
      selectedImagePath.value = pickedfile.path;
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
    var response = await PetService.postPet(pet);
    if (response != null) {
      p.value = pet;
      Get.snackbar('done', "pet added successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color.fromARGB(255, 0, 119, 255),
          colorText: Colors.white);
    } else {
      Get.snackbar('error', "there is something wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  updatePet(Pet pet) async {
    var response = await PetService.putPet(pet);
    if (response != null) {
      p.value = pet;
      Get.snackbar('done', "pet updated  successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color.fromARGB(255, 0, 119, 255),
          colorText: Colors.white);
    } else {
      Get.snackbar('error', "there is something wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  addImageId(int id, String data, String imagepath) async {
    //final image = Image.file(File(imagepath));

    var response = await PetService.uploadImage(id, data, imagepath);

    if (response == true) {
      Get.snackbar('done', "successful operation",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color.fromARGB(255, 0, 119, 255),
          colorText: Colors.white);
    } else {
      Get.snackbar('error', "Error: response status is 500",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  findByStatus(String ch) async {
    var response = await PetService.finPetByStatus(ch);
    print(response!.length);
  }

  findPetById(int x) async {
    var response = await PetService.findPetById(x);

    if (response != null) {
      print(response.id);
    } else {
      var code = await http
          .get(Uri.parse("https://petstore.swagger.io/v2/pet/$x"), headers: {
        'Accept': 'application/json',
      });

      if (code.statusCode == 400) {
        Get.snackbar('error', "Invalid ID supplied",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } else if (code.statusCode == 404) {
        Get.snackbar('error', "Pet not found",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }
  }

  updatePetById(int id, String name, String status) async {
    var response = await PetService.UpdatePetWithId(id, name, status);
    print(response);
    if (response == true) {
      Get.snackbar('done', "pet updated ! ",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } else {
      Get.snackbar('error', "Invalid input",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  deletPetById(int id) async {
    var response = await PetService.deletPetById(id);
    if (response == 200) {
      Get.snackbar('done', "pet deleted ! ",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } else if (response == 400) {
      Get.snackbar('done', "Invalid ID supplied ! ",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } else {
      Get.snackbar('error', "Pet not found ! ",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
