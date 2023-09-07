import 'dart:convert';

HomeResponseModel homeResponseModelFromJson(String str) =>
    HomeResponseModel.fromJson(json.decode(str));

class HomeResponseModel {
  final List<String> books;

  HomeResponseModel({required this.books});

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(books: List<String>.from(json["books"].map((x) => x)));
}
