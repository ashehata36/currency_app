// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeseries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeseriesModel _$TimeseriesModelFromJson(Map<String, dynamic> json) => TimeseriesModel(
      motd: MotdModel.fromJson(json['motd'] as Map<String, dynamic>),
      success: json['success'] as bool,
      timeseries: json['timeseries'] as bool,
      base: json['base'] as String,
      end_date: json['end_date'] as String,
      start_date: json['start_date'] as String,
      rates: (json['rates'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, (e as num).toDouble()),
            )),
      ),
    );

Map<String, dynamic> _$TimeseriesModelToJson(TimeseriesModel instance) => <String, dynamic>{
      'motd': instance.motd.toJson(),
      'success': instance.success,
      'timeseries': instance.timeseries,
      'base': instance.base,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'rates': instance.rates,
    };
