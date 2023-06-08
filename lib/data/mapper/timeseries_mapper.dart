import 'package:currency_app/app/constants.dart';
import 'package:currency_app/app/extensions.dart';
import 'package:currency_app/data/mapper/base_mapper.dart';
import 'package:currency_app/data/response/base_response/base_response.dart';
import 'package:currency_app/data/response/timeseries_response/timeseries_response.dart';
import 'package:currency_app/domain/model/timeseries_model/timeseries_model.dart';

extension TimeseriesResponseMapper on TimeseriesResponse? {
  TimeseriesModel toDomain() {
    return TimeseriesModel(
      start_date: this?.start_date.orEmpty() ?? Constants.empty,
      end_date: this?.end_date.orEmpty() ?? Constants.empty,
      timeseries: this?.timeseries.orFalse() ?? Constants.falseValue,
      success: this?.success.orFalse() ?? Constants.falseValue,
      motd: this?.motd.toDomain() ?? MotdResponse().toDomain(),
      base: this?.base.orEmpty() ?? Constants.empty,
      rates: this?.rates ?? {},
    );
  }
}
