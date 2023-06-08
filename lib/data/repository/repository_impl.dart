import 'package:currency_app/data/data_source/remote_data_source.dart';
import 'package:currency_app/data/mapper/timeseries_mapper.dart';
import 'package:currency_app/data/mapper/convert_mapper.dart';
import 'package:currency_app/domain/model/convert_model/convert_model.dart';
import 'package:currency_app/domain/model/timeseries_model/timeseries_model.dart';
import 'package:currency_app/domain/repository/repository.dart';

class RepositoryImp implements Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImp(this.remoteDataSource);

  @override
  Future<ConvertModel> convert(String from, String to) async {
    final response = await remoteDataSource.convert(from, to);
    return response.toDomain();
  }

  @override
  Future<TimeseriesModel> filterByStartAndEndDate(String start_date, String end_date) async {
    final response = await remoteDataSource.filterByStartAndEndDate(start_date, end_date);
    return response.toDomain();
  }
}
