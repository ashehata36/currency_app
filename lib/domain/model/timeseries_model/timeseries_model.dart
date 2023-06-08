import 'package:currency_app/domain/model/base_model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timeseries_model.g.dart';

@JsonSerializable()
class TimeseriesModel extends BaseModel {
  bool timeseries;
  String base;
  String start_date;
  String end_date;
  Map<String, Map<String, double>> rates;

  TimeseriesModel({
    required super.motd,
    required super.success,
    required this.timeseries,
    required this.base,
    required this.end_date,
    required this.start_date,
    required this.rates,
  });

  //From json
  factory TimeseriesModel.fromJson(Map<String, dynamic> json) => _$TimeseriesModelFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$TimeseriesModelToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TimeseriesModel;
  }

  @override
  int get hashCode {
    return motd.hashCode ^
        success.hashCode ^
        timeseries.hashCode ^
        base.hashCode ^
        end_date.hashCode ^
        start_date.hashCode ^
        rates.hashCode;
  }
}
