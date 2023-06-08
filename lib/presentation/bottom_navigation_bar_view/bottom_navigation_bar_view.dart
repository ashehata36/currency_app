import 'package:currency_app/presentation/utilities/resources/color_manager.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarView> createState() => _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IndexCubit, IndexStates>(
      listener: (context, states) {},
      builder: (context, states) => Scaffold(
        body: SafeArea(
          child: IndexCubit.get(context).pageOptions[IndexCubit.get(context).index],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: ColorManager.primary,
          animationCurve: Curves.decelerate,
          buttonBackgroundColor: ColorManager.primary,
          index: IndexCubit.get(context).index,
          items: [
            Icon(FontAwesomeIcons.arrowRightArrowLeft, color: ColorManager.white),
            Icon(FontAwesomeIcons.clockRotateLeft, color: ColorManager.white),
          ],
          onTap: IndexCubit.get(context).setIndex,
          backgroundColor: ColorManager.white,
        ),
      ),
    );
  }
}
