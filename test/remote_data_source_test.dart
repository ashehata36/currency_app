import 'package:currency_app/data/data_source/remote_data_source.dart';
import 'package:currency_app/data/mapper/timeseries_mapper.dart';
import 'package:currency_app/data/mapper/convert_mapper.dart';
import 'package:currency_app/data/network/network_service.dart';
import 'package:currency_app/data/repository/repository_impl.dart';
import 'package:currency_app/data/response/convert_response/convert_response.dart';
import 'package:currency_app/data/response/timeseries_response/timeseries_response.dart';
import 'package:currency_app/domain/model/timeseries_model/timeseries_model.dart';
import 'package:currency_app/domain/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remote_data_source_test.mocks.dart';

@GenerateMocks([NetworkService])
void main() {
  late NetworkService mockitoNetworkService;
  late RemoteDataSource remoteDataSource;
  late Repository repository;
  setUp(() {
    mockitoNetworkService = MockNetworkService();
    remoteDataSource = RemoteDataSourceImpl(mockitoNetworkService);
    repository = RepositoryImp(remoteDataSource);
  });

  test("Convert between two currency", () async {
    //arrange
    final Map<String, dynamic> convertData = {
      "motd": {
        "msg":
            "If you or your company use this project or like what we doing, please consider backing us so we can continue maintaining and evolving this project.",
        "url": "https://exchangerate.host/#/donate"
      },
      "success": true,
      "query": {"from": "USD", "to": "EUR", "amount": 1},
      "info": {"rate": 0.933344},
      "historical": false,
      "date": "2023-06-08",
      "result": 0.933344
    };

    final data = ConvertResponse.fromJson(convertData);

    when(
      mockitoNetworkService.get(
        "convert",
        queryParameters: {
          "from": "USD",
          "to": "EUR",
        },
      ),
    ).thenAnswer(
      (_) => Future.value(
        convertData,
      ),
    );

    //act
    final result = await repository.convert("USD", "EUR");

    // assert
    expect(result, data.toDomain());
  });

  test("Fetch daily historical rates between two dates of your choice: (2020-01-01 - 2020-01-04)", () async {
    //arrange
    final TimeseriesModel timeseriesModel = TimeseriesResponse().toDomain();

    final data = timeseriesModel.toJson();

    when(
      mockitoNetworkService.get(
        "timeseries",
        queryParameters: {
          "start_date": "2020-01-01",
          "end_date": "2020-01-04",
        },
      ),
    ).thenAnswer(
      (_) => Future.value(
        data,
      ),
    );

    //act
    final result = await repository.filterByStartAndEndDate("2020-01-01", "2020-01-04");

    // assert
    expect(result, timeseriesModel);
  });
}
