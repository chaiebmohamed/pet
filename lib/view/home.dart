import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("pets"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              field("id"),
              const SizedBox(
                height: 10,
              ),
              field("category id"),
              const SizedBox(
                height: 10,
              ),
              field("category name"),
              const SizedBox(
                height: 10,
              ),
              field("name"),
              const SizedBox(
                height: 10,
              ),
              field("photo path"),
              const SizedBox(
                height: 10,
              ),
              field("tags id"),
              const SizedBox(
                height: 10,
              ),
              field("tags name"),
              const SizedBox(
                height: 10,
              ),
              field("status"),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget field(String name) {
  return TextFormField(
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
