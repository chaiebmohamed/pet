import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pet/model/pet.dart';

class PetService {
  static Future<Pet?> postPet(Pet pet) async {
    var response =
        await http.post(Uri.parse("https://petstore.swagger.io/v2/pet"),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: json.encode(pet));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return petFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<String?> putPet(Pet pet) async {
    var response =
        await http.put(Uri.parse("https://petstore.swagger.io/v2/pet"),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: json.encode(pet));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return "pet updated successfully";
    } else if (response.statusCode == 400) {
      return "Invalid ID supplied ";
    } else if (response.statusCode == 404) {
      return "Pet not found";
    } else {
      return "Validation exception";
    }
  }

  static Future<bool> uploadImage(
    int id,
    String data,
    Image image,
  ) async {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['additionalMetadata'] = data;
    map['file'] = image;

    var response = await http.post(
        Uri.parse("https://petstore.swagger.io/v2/pet/$id/uploadImage"),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: map);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
