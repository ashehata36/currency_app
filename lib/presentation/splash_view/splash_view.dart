import 'dart:async';
import 'package:currency_app/presentation/utilities/resources/assets_manager.dart';
import 'package:currency_app/presentation/utilities/resources/color_manager.dart';
import 'package:currency_app/presentation/utilities/resources/constants_manage.dart';
import 'package:currency_app/presentation/utilities/resources/routes_manager.dart';
import 'package:currency_app/presentation/utilities/resources/values_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  void _goNext() async {
    if (mounted) {
      Navigator.pushReplacementNamed(
        context,
        Routes.bottomNavigationBarRoute,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorManager.primary,
          image: const DecorationImage(
            image: AssetImage(ImageAssets.splashLogo),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(AppSize.s14),
        ),
      ),
    );
  }
}
