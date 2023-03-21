import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickField extends StatelessWidget {
  const DatePickField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Date",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            readOnly: true,
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
              hintText: DateFormat().add_yMMMd().format(DateTime.now()),
            ),
            onTap: () async {
              var date = await showDatePicker(
                initialDatePickerMode: DatePickerMode.year,
                initialEntryMode: DatePickerEntryMode.calendar,
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: ColorScheme.fromSwatch(
                        primarySwatch: Colors.blue,
                      ),
                    ),
                    child: child!,
                  );
                },
              );

              if (date == null) {
                controller.text =
                    DateFormat().add_yMMMd().format(DateTime.now());
              } else {
                controller.text = DateFormat().add_yMMMd().format(date);
              }
            },
          ),
        ],
      ),
    );
  }
}
