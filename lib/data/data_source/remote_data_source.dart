import 'package:currency_app/data/network/network_service.dart';
import 'package:currency_app/data/response/convert_response/convert_response.dart';

import '../response/timeseries_response/timeseries_response.dart';

abstract class RemoteDataSource {
  Future<ConvertResponse> convert(String from, String to);

  Future<TimeseriesResponse> filterByStartAndEndDate(String from, String to);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final NetworkService networkService;

  RemoteDataSourceImpl(this.networkService);

  @override
  Future<ConvertResponse> convert(String from, String to) async {
    final convertResponse = await networkService.get(
      "convert",
      queryParameters: {
        "from": from,
        "to": to,
      },
    );
    return ConvertResponse.fromJson(convertResponse);
  }

  @override
  Future<TimeseriesResponse> filterByStartAndEndDate(String start_date, String end_date) async {
    final filterByStartAndEndDateResponse = await networkService.get(
      "timeseries",
      queryParameters: {
        "start_date": start_date,
        "end_date": end_date,
      },
    );
    return TimeseriesResponse.fromJson(filterByStartAndEndDateResponse);
  }
}
