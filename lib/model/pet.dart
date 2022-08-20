// To parse this JSON data, do
//
//     final pet = petFromJson(jsonString);

import 'dart:convert';

Pet petFromJson(String str) => Pet.fromJson(json.decode(str));

String petToJson(Pet data) => json.encode(data.toJson());

class Pet {
    Pet({
         this.id,
         this.category,
         this.name,
         this.photoUrls,
         this.tags,
         this.status,
    });

    int? id;
    Category? category;
    String? name;
    List<String>? photoUrls;
    List<Category>? tags;
    String? status;

    factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["id"],
        category: Category.fromJson(json["category"]),
        name: json["name"],
        photoUrls: List<String>.from(json["photoUrls"].map((x) => x)),
        tags: List<Category>.from(json["tags"].map((x) => Category.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category?.toJson(),
        "name": name,
        "photoUrls": List<dynamic>.from(photoUrls!.map((x) => x)),
        "tags": List<dynamic>.from(tags!.map((x) => x.toJson())),
        "status": status,
    };
}

class Category {
    Category({
         this.id,
         this.name,
    });

    int? id;
    String ? name;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
