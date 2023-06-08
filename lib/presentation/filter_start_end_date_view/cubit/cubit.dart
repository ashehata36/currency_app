import 'package:currency_app/data/data_source/remote_data_source.dart';
import 'package:currency_app/data/mapper/timeseries_mapper.dart';
import 'package:currency_app/data/network/network_service.dart';
import 'package:currency_app/data/repository/repository_impl.dart';
import 'package:currency_app/data/response/timeseries_response/timeseries_response.dart';
import 'package:currency_app/domain/model/timeseries_model/timeseries_model.dart';
import 'package:currency_app/domain/repository/repository.dart';
import 'package:currency_app/presentation/filter_start_end_date_view/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<FilterStates> {
  FilterCubit() : super(FilterInitialState());

  static FilterCubit get(context) => BlocProvider.of(context);

  TimeseriesModel filterByStartAndEndDateData = TimeseriesResponse().toDomain();
  int length = 0;
  int paginationLen = 0;
  List<String> lengthOfEachTitle = [];

  filterByStartAndEndDate(String start_date, String end_date) async {
    NetworkService networkService = NetworkService();
    RemoteDataSource remoteDataSource = RemoteDataSourceImpl(networkService);
    final Repository repository = RepositoryImp(
      remoteDataSource,
    );
    emit(LoadingState());
    try {
      filterByStartAndEndDateData = await repository.filterByStartAndEndDate(start_date, end_date);
      for (var element in filterByStartAndEndDateData.rates.entries) {
        lengthOfEachTitle.add(element.key);
        element.value.forEach((key, value) {
          lengthOfEachTitle.add("$key : $value");
        });
      }
      paginationLen = lengthOfEachTitle.length < 10 ? lengthOfEachTitle.length : 10;
      emit(LoadedState());
    } catch (e) {
      emit(ErrorState());
    }
  }

  void seeMore() async {
    emit(LoadingState());
    paginationLen = paginationLen < lengthOfEachTitle.length
        ? (paginationLen + 10) > lengthOfEachTitle.length
            ? lengthOfEachTitle.length
            : paginationLen + 10
        : lengthOfEachTitle.length;
    emit(LoadedState());
  }
}
