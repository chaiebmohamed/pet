import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pet/controller/pet_controller.dart';
import 'package:pet/view/add_image_to_pet.dart';

class DeletPetById extends StatelessWidget {
  const DeletPetById({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PetController controller = Get.put(PetController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("delet pet by id "),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            field("id", controller.id),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => controller.updatePetById(
                  int.parse(controller.id.text),
                  controller.name.text,
                  controller.status.text),
              child: const Text(
                'delet pet by id  ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
