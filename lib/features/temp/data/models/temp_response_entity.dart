import 'dart:convert';

import 'package:dev_banna/generated/json/base/json_field.dart';
import 'package:dev_banna/generated/json/temp_response_entity.g.dart';

typedef TempDataModelResource = List<TempDataModel>?;

@JsonSerializable()
class TempResponseEntity {
  int? status;
  List<TempDataModel>? data;
  String? message;

  TempResponseEntity();

  factory TempResponseEntity.fromJson(Map<String, dynamic> json) =>
      $TempResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $TempResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TempDataModel {
  String? id;
  String? name;
  String? image;

  TempDataModel();

  factory TempDataModel.fromJson(Map<String, dynamic> json) =>
      $TempDataModelFromJson(json);

  Map<String, dynamic> toJson() => $TempDataModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
