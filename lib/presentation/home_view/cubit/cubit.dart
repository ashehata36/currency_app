import 'package:currency_app/data/data_source/remote_data_source.dart';
import 'package:currency_app/data/mapper/convert_mapper.dart';
import 'package:currency_app/data/network/network_service.dart';
import 'package:currency_app/data/repository/repository_impl.dart';
import 'package:currency_app/domain/model/convert_model/convert_model.dart';
import 'package:currency_app/domain/repository/repository.dart';
import 'package:currency_app/presentation/home_view/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/response/convert_response/convert_response.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  ConvertModel convertData = ConvertResponse().toDomain();

  convert() async{
    NetworkService networkService = NetworkService();
    RemoteDataSource remoteDataSource = RemoteDataSourceImpl(networkService);
    final Repository repository = RepositoryImp(
      remoteDataSource,
    );
    emit(LoadingState());
    try {
      convertData = await repository.convert(fromController.text, toController.text);
      emit(LoadedState());
    } catch (e) {
      print("Error = ${e.toString()}");
      emit(ErrorState());
    }
  }
}
