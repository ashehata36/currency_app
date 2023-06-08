import 'package:currency_app/data/response/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timeseries_response.g.dart';

@JsonSerializable()
class TimeseriesResponse extends BaseResponse {
  @JsonKey(name: "timeseries")
  bool? timeseries;
  @JsonKey(name: "base")
  String? base;
  @JsonKey(name: "start_date")
  String? start_date;
  @JsonKey(name: "end_date")
  String? end_date;
  @JsonKey(name: "rates")
  Map<String, Map<String, double>>? rates;

  TimeseriesResponse({
    super.motd,
    super.success,
    this.timeseries,
    this.base,
    this.end_date,
    this.start_date,
    this.rates,
  });

  //From json
  factory TimeseriesResponse.fromJson(Map<String, dynamic> json) => _$TimeseriesResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$TimeseriesResponseToJson(this);
}
