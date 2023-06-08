import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class MotdResponse {
  @JsonKey(name: "msg")
  String? msg;
  @JsonKey(name: "url")
  String? url;

  MotdResponse({
    this.msg,
    this.url,
  });

  //From json
  factory MotdResponse.fromJson(Map<String, dynamic> json) => _$MotdResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$MotdResponseToJson(this);
}

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "motd")
  MotdResponse? motd;
  @JsonKey(name: "success")
  bool? success;

  BaseResponse({
    this.motd,
    this.success,
  });

  //From json
  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
