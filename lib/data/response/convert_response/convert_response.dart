import 'package:currency_app/data/response/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'convert_response.g.dart';

@JsonSerializable()
class QueryResponse {
  @JsonKey(name: "from")
  String? from;
  @JsonKey(name: "to")
  String? to;
  @JsonKey(name: "amount")
  int? amount;

  QueryResponse({
    this.from,
    this.to,
    this.amount,
  });

  //From json
  factory QueryResponse.fromJson(Map<String, dynamic> json) => _$QueryResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$QueryResponseToJson(this);
}

@JsonSerializable()
class InfoResponse {
  @JsonKey(name: "rate")
  double? rate;

  InfoResponse({
    this.rate,
  });

  //From json
  factory InfoResponse.fromJson(Map<String, dynamic> json) => _$InfoResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$InfoResponseToJson(this);
}

@JsonSerializable()
class ConvertResponse extends BaseResponse {
  @JsonKey(name: "date")
  String? date;
  @JsonKey(name: "historical")
  bool? historical;
  @JsonKey(name: "result")
  double? result;
  @JsonKey(name: "query")
  QueryResponse? query;
  @JsonKey(name: "info")
  InfoResponse? info;

  ConvertResponse({
    this.date,
    this.historical,
    this.result,
    this.info,
    this.query,
    super.motd,
    super.success,
  });

  //From json
  factory ConvertResponse.fromJson(Map<String, dynamic> json) => _$ConvertResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$ConvertResponseToJson(this);
}
