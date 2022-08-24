import 'package:flutter/material.dart';

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
