import 'package:currency_app/app/extensions.dart';
import 'package:currency_app/presentation/home_view/cubit/cubit.dart';
import 'package:currency_app/presentation/home_view/cubit/states.dart';
import 'package:currency_app/presentation/utilities/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final homeCubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, states) {},
      builder: (context, states) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppPadding.p24,
              AppPadding.p24,
              AppPadding.p24,
              AppPadding.p8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Currency converter",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                AppSize.s22.ph,
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: homeCubit.fromController,
                              textDirection: TextDirection.ltr,
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                  RegExp(r'\d'),
                                ),
                              ],
                              decoration: const InputDecoration(
                                hintText: "From",
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppPadding.p12),
                            child: Icon(
                              FontAwesomeIcons.rightLeft,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: homeCubit.toController,
                              textDirection: TextDirection.ltr,
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                  RegExp(r'\d'),
                                ),
                              ],
                              decoration: const InputDecoration(
                                hintText: "To",
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (states is LoadingState) CircularProgressIndicator(),
                      if (states is LoadedState) ...[
                        AppSize.s12.ph,
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                homeCubit.convertData.query.amount.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: AppPadding.p12),
                              child: Icon(
                                FontAwesomeIcons.equals,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                homeCubit.convertData.result.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                      AppSize.s12.ph,
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (homeCubit.fromController.text.isNotEmpty &&
                                homeCubit.toController.text.isNotEmpty) {
                              homeCubit.convert();
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: AppPadding.p8),
                            child: Text("Convert"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
