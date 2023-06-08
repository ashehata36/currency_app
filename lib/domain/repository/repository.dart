import 'package:currency_app/domain/model/convert_model/convert_model.dart';
import 'package:currency_app/domain/model/timeseries_model/timeseries_model.dart';

abstract class Repository {
  Future<ConvertModel> convert(String from, String to);

  Future<TimeseriesModel> filterByStartAndEndDate(String start_date, String end_date);
}
