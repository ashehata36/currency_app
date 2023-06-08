// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convert_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryResponse _$QueryResponseFromJson(Map<String, dynamic> json) =>
    QueryResponse(
      from: json['from'] as String?,
      to: json['to'] as String?,
      amount: json['amount'] as int?,
    );

Map<String, dynamic> _$QueryResponseToJson(QueryResponse instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'amount': instance.amount,
    };

InfoResponse _$InfoResponseFromJson(Map<String, dynamic> json) => InfoResponse(
      rate: (json['rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$InfoResponseToJson(InfoResponse instance) =>
    <String, dynamic>{
      'rate': instance.rate,
    };

ConvertResponse _$ConvertResponseFromJson(Map<String, dynamic> json) =>
    ConvertResponse(
      date: json['date'] as String?,
      historical: json['historical'] as bool?,
      result: (json['result'] as num?)?.toDouble(),
      info: json['info'] == null
          ? null
          : InfoResponse.fromJson(json['info'] as Map<String, dynamic>),
      query: json['query'] == null
          ? null
          : QueryResponse.fromJson(json['query'] as Map<String, dynamic>),
      motd: json['motd'] == null
          ? null
          : MotdResponse.fromJson(json['motd'] as Map<String, dynamic>),
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$ConvertResponseToJson(ConvertResponse instance) =>
    <String, dynamic>{
      'motd': instance.motd,
      'success': instance.success,
      'date': instance.date,
      'historical': instance.historical,
      'result': instance.result,
      'query': instance.query,
      'info': instance.info,
    };
