import 'package:currency_app/app/constants.dart';
import 'package:currency_app/app/extensions.dart';
import 'package:currency_app/data/response/base_response/base_response.dart';
import 'package:currency_app/domain/model/base_model/base_model.dart';

extension MotdResponseMapper on MotdResponse? {
  MotdModel toDomain() {
    return MotdModel(
      url: this?.url.orEmpty() ?? Constants.empty,
      msg: this?.msg.orEmpty() ?? Constants.empty,
    );
  }
}

extension BaseResponseMapper on BaseResponse? {
  BaseModel toDomain() {
    return BaseModel(
      success: this?.success.orFalse() ?? Constants.falseValue,
      motd: this?.motd.toDomain() ?? MotdResponse().toDomain(),
    );
  }
}
