import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io' as o;

import '../controller/pet_controller.dart';

class AddImage extends StatelessWidget {
  const AddImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PetController controller = Get.put(PetController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("add image to pet"),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            field("id", controller.id),
            field("additionalMetadata", controller.additionalMetadata),
            Obx(() => Text(
                "select image from gallery / camera \n Image selected ${controller.imageList.length}")),
            Obx(() => controller.selectedImagePath.value == ''
                ? const Text("select image from gallery / camera")
                : Container(
                    height: size.width / 1,
                    width: size.width / 1.9,
                    child: Image.file(
                      o.File(controller.selectedImagePath.value),
                    ),
                  ))
          ],
        ),
      )),
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
