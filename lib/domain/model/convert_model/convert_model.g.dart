// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryModel _$QueryModelFromJson(Map<String, dynamic> json) => QueryModel(
      from: json['from'] as String,
      to: json['to'] as String,
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$QueryModelToJson(QueryModel instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'amount': instance.amount,
    };

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) => InfoModel(
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$InfoModelToJson(InfoModel instance) => <String, dynamic>{
      'rate': instance.rate,
    };

ConvertModel _$ConvertModelFromJson(Map<String, dynamic> json) => ConvertModel(
      date: json['date'] as String,
      historical: json['historical'] as bool,
      result: (json['result'] as num).toDouble(),
      info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
      query: QueryModel.fromJson(json['query'] as Map<String, dynamic>),
      motd: MotdModel.fromJson(json['motd'] as Map<String, dynamic>),
      success: json['success'] as bool,
    );

Map<String, dynamic> _$ConvertModelToJson(ConvertModel instance) =>
    <String, dynamic>{
      'motd': instance.motd,
      'success': instance.success,
      'date': instance.date,
      'historical': instance.historical,
      'result': instance.result,
      'query': instance.query,
      'info': instance.info,
    };
