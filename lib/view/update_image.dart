// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/pet_controller.dart';

class UpdateImage extends StatelessWidget {
  const UpdateImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PetController controller = Get.put(PetController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Image by id"),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            field("id", controller.id),
            const SizedBox(height: 15),
            field("additionalMetadata", controller.additionalMetadata),
            const SizedBox(height: 15),
            const Text("select image from gallery / camera \n Image selected "),
            RaisedButton(
              onPressed: () {
                controller.updateImage(ImageSource.camera);
              },
              child: const Text("Camera"),
            ),
            RaisedButton(
              onPressed: () {
                controller.updateImage(ImageSource.gallery);
              },
              child: const Text("Gallery"),
            ),
            const SizedBox(height: 15),
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
                onTap: () => controller.addImageId(
                    5,
                    controller.additionalMetadata.text,
                    controller.selectedImagePath.value),
                child: const Text(
                  'update the pet ',
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
