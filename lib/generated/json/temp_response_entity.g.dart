import 'package:byaan/generated/json/base/json_convert_content.dart';
import 'package:byaan/features/temp/data/models/temp_response_entity.dart';

TempResponseEntity $TempResponseEntityFromJson(Map<String, dynamic> json) {
	final TempResponseEntity tempResponseEntity = TempResponseEntity();
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		tempResponseEntity.status = status;
	}
	final List<TempDataModel>? data = jsonConvert.convertListNotNull<TempDataModel>(json['data']);
	if (data != null) {
		tempResponseEntity.data = data;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		tempResponseEntity.message = message;
	}
	return tempResponseEntity;
}

Map<String, dynamic> $TempResponseEntityToJson(TempResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	data['message'] = entity.message;
	return data;
}

TempDataModel $TempDataModelFromJson(Map<String, dynamic> json) {
	final TempDataModel tempDataModel = TempDataModel();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		tempDataModel.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		tempDataModel.name = name;
	}
	final String? image = jsonConvert.convert<String>(json['image']);
	if (image != null) {
		tempDataModel.image = image;
	}
	return tempDataModel;
}

Map<String, dynamic> $TempDataModelToJson(TempDataModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['image'] = entity.image;
	return data;
}