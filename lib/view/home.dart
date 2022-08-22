// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet/controller/pet_controller.dart';
import 'dart:io' as o;

import 'package:pet/model/pet.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PetController controller = Get.put(PetController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("add pet"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              field("id", controller.id),
              const SizedBox(
                height: 10,
              ),
              field("category id", controller.categoryId),
              const SizedBox(
                height: 10,
              ),
              field("category name", controller.categoryName),
              const SizedBox(
                height: 10,
              ),
              field("name", controller.name),
              const SizedBox(
                height: 10,
              ),
              Obx(() => Text(
                  "select image from gallery / camera \n Image selected ${controller.imageList.length}")),
              RaisedButton(
                onPressed: () {
                  controller.getImage(ImageSource.camera);
                },
                child: const Text("Camera"),
              ),
              RaisedButton(
                onPressed: () {
                  controller.getImage(ImageSource.gallery);
                },
                child: const Text("Gallery"),
              ),
              const SizedBox(
                height: 10,
              ),
              field("tags id", controller.tagsId),
              const SizedBox(
                height: 10,
              ),
              field("tags name", controller.tagsName),
              Container(
                margin: EdgeInsets.only(
                  bottom: size.width * .05,
                ),
                height: size.width / 8,
                width: size.width / 1.25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GestureDetector(
                  onTap: () => controller.addTag(
                      int.parse(controller.tagsId.text),
                      controller.tagsName.text),
                  child: const Text(
                    'add tag',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              field("status", controller.status),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: size.width * .05,
                ),
                height: size.width / 8,
                width: size.width / 1.25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GestureDetector(
                  onTap: () => controller.postPet(Pet(
                      id: int.parse(controller.id.text),
                      category: Category(
                          id: int.parse(controller.categoryId.text),
                          name: controller.categoryName.text),
                      name: controller.name.text,
                      photoUrls: controller.imageList,
                      tags: controller.taglist,
                      status: controller.status.text)),
                  child: const Text(
                    'post the pet ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget field(String name, TextEditingController x) {
  return TextFormField(
    controller: x,
    decoration: InputDecoration(
      labelText: name,
      labelStyle:
          const TextStyle(color: Color.fromARGB(255, 5, 5, 5), fontSize: 20),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF6200EE)),
      ),
    ),
  );
}
