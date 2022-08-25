import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pet/view/addpet.dart';
import 'package:pet/view/delet_pet_by_id.dart';
import 'package:pet/view/find_pet_by_id.dart';
import 'package:pet/view/select_by_status.dart';
import 'package:pet/view/update_image.dart';
import 'package:pet/view/update_pet.dart';
import 'package:pet/view/update_pet_by_id.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home page"),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('pet options'),
          ),
          ListTile(
            title: const Text("add pet"),
            onTap: () => Get.to(PostPet()),
          ),
          ListTile(
            title: const Text("delet pet by id"),
            onTap: () => Get.to(const DeletPetById()),
          ),
          ListTile(
            title: const Text("find pet by id"),
            onTap: () => Get.to(const FindPetById()),
          ),
          ListTile(
            title: const Text("select pet by status "),
            onTap: () => Get.to(SelectByStatus()),
          ),
          ListTile(
            title: const Text("update pet image "),
            onTap: () => Get.to(const UpdateImage()),
          ),
          ListTile(
            title: const Text("update pet by id "),
            onTap: () => Get.to(const UpdatePetById()),
          ),
          ListTile(
            title: const Text("update pet "),
            onTap: () => Get.to(UpdatePet()),
          ),
        ],
      )),
      body: const Center(
        child: Text("Welecome to the pet store"),
      ),
    );
  }
}
