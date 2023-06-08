import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable()
class MotdModel {
  String msg;
  String url;

  MotdModel({
    required this.msg,
    required this.url,
  });

  //From json
  factory MotdModel.fromJson(Map<String, dynamic> json) => _$MotdModelFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$MotdModelToJson(this);
}

@JsonSerializable()
class BaseModel {
  MotdModel motd;
  bool success;

  BaseModel({
    required this.motd,
    required this.success,
  });

  //From json
  factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}
