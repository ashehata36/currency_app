// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MotdModel _$MotdModelFromJson(Map<String, dynamic> json) => MotdModel(
      msg: json['msg'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$MotdModelToJson(MotdModel instance) => <String, dynamic>{
      'msg': instance.msg,
      'url': instance.url,
    };

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) => BaseModel(
      motd: MotdModel.fromJson(json['motd'] as Map<String, dynamic>),
      success: json['success'] as bool,
    );

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'motd': instance.motd,
      'success': instance.success,
    };
