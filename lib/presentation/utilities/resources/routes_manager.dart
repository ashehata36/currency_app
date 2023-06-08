import 'package:currency_app/presentation/bottom_navigation_bar_view/bottom_navigation_bar_view.dart';
import 'package:currency_app/presentation/bottom_navigation_bar_view/cubit/cubit.dart';
import 'package:currency_app/presentation/filter_start_end_date_view/cubit/cubit.dart';
import 'package:currency_app/presentation/filter_start_end_date_view/filter_result_view.dart';
import 'package:currency_app/presentation/home_view/cubit/cubit.dart';
import 'package:currency_app/presentation/home_view/home_view.dart';
import 'package:currency_app/presentation/splash_view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String splashRoute = '/';
  static const String bottomNavigationBarRoute = '/bottomNavigationBar';
  static const String homeRoute = '/home';
  static const String filterResultRoute = '/filterResultView';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
          settings: routeSettings,
        );
      case Routes.bottomNavigationBarRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<IndexCubit>(
            create: (context) => IndexCubit(),
            child: const BottomNavigationBarView(),
          ),
          settings: routeSettings,
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(),
            child: const HomeView(),
          ),
          settings: routeSettings,
        );
      case Routes.filterResultRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<FilterCubit>(
            create: (context) => FilterCubit(),
            child: FilterResultView(
              date: routeSettings.arguments as List<String>,
            ),
          ),
          settings: routeSettings,
        );
      default:
        return unDefinedRoute();
    }
  }

  static Widget getPage(String routeSettings) {
    switch (routeSettings) {
      case Routes.splashRoute:
        return SplashView();
      case Routes.bottomNavigationBarRoute:
        return BottomNavigationBarView();
      default:
        return unDefinedPage();
    }
  }

  static Route<dynamic> unDefinedRoute() => MaterialPageRoute(
        builder: (_) => unDefinedPage(),
      );

  static Widget unDefinedPage() => Scaffold(
        appBar: AppBar(
          title: const Text("Un Defined Route"),
        ),
        body: const Center(
          child: Text("Un Defined Route"),
        ),
      );
}
