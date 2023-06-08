import 'package:currency_app/app/constants.dart';
import 'package:currency_app/app/extensions.dart';
import 'package:currency_app/presentation/utilities/resources/routes_manager.dart';
import 'package:currency_app/presentation/utilities/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FilterStartEndDateView extends StatefulWidget {
  const FilterStartEndDateView({Key? key}) : super(key: key);

  @override
  State<FilterStartEndDateView> createState() => _FilterStartEndDateViewState();
}

class _FilterStartEndDateViewState extends State<FilterStartEndDateView> {
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppPadding.p24,
            AppPadding.p24,
            AppPadding.p24,
            AppPadding.p8,
          ),
          child: Form(
            child: Column(
              children: [
                Text(
                  "Enter the start date and end date for the desired period of time.",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                AppSize.s22.ph,
                TextFormField(
                  controller: startDateController,
                  decoration: InputDecoration(
                    hintText: "Start date",
                    suffixIcon: IconButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          firstDate: DateTime(2019),
                          lastDate: DateTime.now(),
                        ).then((value) {
                          if (value != null) startDateController.text = DateFormat(Constants.dateFormat).format(value);
                        });
                      },
                      icon: const Icon(Icons.date_range),
                    ),
                  ),
                  readOnly: true,
                ),
                AppSize.s12.ph,
                TextFormField(
                  controller: endDateController,
                  decoration: InputDecoration(
                    hintText: "End date",
                    suffixIcon: IconButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          firstDate: DateTime(2019),
                          lastDate: DateTime.now(),
                        ).then((value) {
                          if (value != null) endDateController.text = DateFormat(Constants.dateFormat).format(value);
                        });
                      },
                      icon: const Icon(Icons.date_range),
                    ),
                  ),
                  readOnly: true,
                ),
                AppSize.s12.ph,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (startDateController.text.isNotEmpty && endDateController.text.isNotEmpty) {
                        Navigator.pushNamed(
                          context,
                          Routes.filterResultRoute,
                          arguments: [startDateController.text, endDateController.text],
                        );
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: AppPadding.p8),
                      child: Text("Submit"),
                    ),
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
