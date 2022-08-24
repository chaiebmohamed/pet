import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pet/model/pet.dart';
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';

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

  //add form data
  static Future<bool> uploadImage(
    int id,
    String data,
    String image,
  ) async {
    final imageUploadRequest = http.MultipartRequest('POST',
        Uri.parse('https://petstore.swagger.io/v2/pet/$id/uploadImage'));
    //final mineTypeData = lookupMimeType(image, headerBytes: [0xFF])?.split('/');
    final file = await http.MultipartFile.fromPath(
      'file',
      image,
    );
    imageUploadRequest.files.add(file);
    imageUploadRequest.fields["petId"] = id.toString();
    imageUploadRequest.fields["additionalMetadata"] = data;

    final streamedResponse = await imageUploadRequest.send();
    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<Pet>?> finPetByStatus(String ch) async {
    var response = await http.get(
      Uri.parse(
          "https://petstore.swagger.io/v2/pet/findByStatus?status=available,pending,sold"),
      headers: {
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return petFromJsonList(response.body);
    }
  }

  static Future<Pet?> findPetById(int x) async {
    var response = await http
        .get(Uri.parse("https://petstore.swagger.io/v2/pet/$x"), headers: {
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return petFromJson(response.body);
    } else {
      return null;
    }
  }

  static UpdatePetWithId(int id, String name, String status) async {
    final changeing = http.MultipartRequest(
        'POST', Uri.parse('https://petstore.swagger.io/v2/pet/3'));

    changeing.fields["name"] = name;
    changeing.fields["status"] = status;

    final streamedResponse = await changeing.send();
    final response = await http.Response.fromStream(streamedResponse);

    print(changeing.fields);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static deletPetById(int id) async {
    var response = await http.delete(
        Uri.parse("https://petstore.swagger.io/v2/pet/$id"),
        headers: {'Accept': 'application/json', 'api_key': 'mouha'});

    return response.statusCode;
  }
}
