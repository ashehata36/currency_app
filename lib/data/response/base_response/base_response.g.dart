// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MotdResponse _$MotdResponseFromJson(Map<String, dynamic> json) => MotdResponse(
      msg: json['msg'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$MotdResponseToJson(MotdResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'url': instance.url,
    };

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      motd: json['motd'] == null
          ? null
          : MotdResponse.fromJson(json['motd'] as Map<String, dynamic>),
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'motd': instance.motd,
      'success': instance.success,
    };
