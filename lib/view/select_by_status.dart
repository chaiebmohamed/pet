import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:pet/controller/pet_controller.dart';

class SelectByStatus extends StatelessWidget {
  PetController controller = Get.put(PetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select by status"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropDownMultiSelect(
              options: controller.listStatus,
              whenEmpty: "select pet status",
              onChanged: (value) {
                controller.selectedOptionList.value = value;
                controller.selectedoption.value = "";
                for (var element in controller.selectedOptionList.value) {
                  "${controller.selectedoption.value},$element";
                }
              },
              selectedValues: controller.selectedOptionList.value,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () =>
                  controller.findByStatus(controller.selectedoption.value),
              child: const Text(
                'show pets  ',
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
