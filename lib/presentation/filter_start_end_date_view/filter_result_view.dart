import 'package:currency_app/presentation/filter_start_end_date_view/cubit/cubit.dart';
import 'package:currency_app/presentation/utilities/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/states.dart';

class FilterResultView extends StatefulWidget {
  final List<String> date;

  const FilterResultView({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  State<FilterResultView> createState() => _FilterResultViewState();
}

class _FilterResultViewState extends State<FilterResultView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FilterCubit, FilterStates>(
      listener: (context, states) {},
      builder: (context, states) => Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: states is LoadingState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : states is LoadedState
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) => Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                vertical: AppPadding.p8,
                              ),
                              child: ListTile(
                                title: Text(
                                  FilterCubit.get(context).lengthOfEachTitle.elementAt(index),
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            ),
                            itemCount: FilterCubit.get(context).paginationLen,
                            padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.p14,
                              horizontal: AppPadding.p8,
                            ),
                          ),
                        ),
                        if (FilterCubit.get(context).paginationLen < FilterCubit.get(context).lengthOfEachTitle.length)
                          TextButton(
                            onPressed: () {
                              FilterCubit.get(context).seeMore();
                            },
                            child: Text("see more"),
                          ),
                      ],
                    )
                  : Center(
                      child: Text(
                        "An error occurred",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
        ),
      ),
    );
  }

  @override
  void initState() {
    FilterCubit.get(context).filterByStartAndEndDate(widget.date[0], widget.date[1]);
    super.initState();
  }
}
