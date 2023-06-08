import 'package:currency_app/domain/model/base_model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'convert_model.g.dart';

@JsonSerializable()
class QueryModel {
  String from;
  String to;
  int amount;

  QueryModel({
    required this.from,
    required this.to,
    required this.amount,
  });

  //From json
  factory QueryModel.fromJson(Map<String, dynamic> json) => _$QueryModelFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$QueryModelToJson(this);
}

@JsonSerializable()
class InfoModel {
  double rate;

  InfoModel({
    required this.rate,
  });

  //From json
  factory InfoModel.fromJson(Map<String, dynamic> json) => _$InfoModelFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$InfoModelToJson(this);
}

@JsonSerializable()
class ConvertModel extends BaseModel {
  String date;
  bool historical;
  double result;
  QueryModel query;
  InfoModel info;

  ConvertModel({
    required this.date,
    required this.historical,
    required this.result,
    required this.info,
    required this.query,
    required super.motd,
    required super.success,
  });

  //From json
  factory ConvertModel.fromJson(Map<String, dynamic> json) => _$ConvertModelFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$ConvertModelToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConvertModel;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        historical.hashCode ^
        result.hashCode ^
        info.hashCode ^
        query.hashCode ^
        motd.hashCode ^
        success.hashCode;
  }
}
