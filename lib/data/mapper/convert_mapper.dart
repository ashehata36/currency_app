import 'package:currency_app/app/constants.dart';
import 'package:currency_app/app/extensions.dart';
import 'package:currency_app/data/mapper/base_mapper.dart';
import 'package:currency_app/data/response/base_response/base_response.dart';
import 'package:currency_app/data/response/convert_response/convert_response.dart';
import 'package:currency_app/domain/model/convert_model/convert_model.dart';

extension QueryResponseMapper on QueryResponse? {
  QueryModel toDomain() {
    return QueryModel(
      from: this?.from.orEmpty() ?? Constants.empty,
      amount: this?.amount.orZero() ?? Constants.zero,
      to: this?.to.orEmpty() ?? Constants.empty,
    );
  }
}

extension InfoResponseMapper on InfoResponse? {
  InfoModel toDomain() {
    return InfoModel(
      rate: this?.rate.orDouble() ?? Constants.doubleZero,
    );
  }
}

extension ConvertResponseMapper on ConvertResponse? {
  ConvertModel toDomain() {
    return ConvertModel(
      result: this?.result.orDouble() ?? Constants.doubleZero,
      date: this?.date.orEmpty() ?? Constants.empty,
      historical: this?.historical.orFalse() ?? Constants.falseValue,
      success: this?.success.orFalse() ?? Constants.falseValue,
      motd: this?.motd.toDomain() ?? MotdResponse().toDomain(),
      info: this?.info.toDomain() ?? InfoResponse().toDomain(),
      query: this?.query.toDomain() ?? QueryResponse().toDomain(),
    );
  }
}
