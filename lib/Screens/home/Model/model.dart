import 'dart:convert';

List<DataModel> dataModelFromJson(String str) => List<DataModel>.from(
      json.decode(str).map((x) => DataModel.fromJson(x)),
    );

class DataModel {
  DataModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        userId: json["userId"] ?? 0,
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        body: json["body"] ?? "",
      );
}
