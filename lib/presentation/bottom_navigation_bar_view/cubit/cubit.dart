import 'package:currency_app/presentation/bottom_navigation_bar_view/cubit/states.dart';
import 'package:currency_app/presentation/filter_start_end_date_view/filter_start_end_date_view.dart';
import 'package:currency_app/presentation/home_view/cubit/cubit.dart';
import 'package:currency_app/presentation/home_view/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndexCubit extends Cubit<IndexStates> {
  IndexCubit() : super(IndexInitialState());

  static IndexCubit get(context) => BlocProvider.of(context);

  final pageOptions = [
    BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: HomeView(),
    ),
    FilterStartEndDateView(),
  ];

  int index = 0;

  void setIndex(int index) {
    this.index = index;
    emit(IndexChangeState());
  }
}