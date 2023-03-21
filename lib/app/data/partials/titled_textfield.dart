import 'package:flutter/material.dart';

class TitledTextField extends StatelessWidget {
  const TitledTextField({
    Key? key,
    required this.controller,
    required this.name,
    required this.hint,
  }) : super(key: key);

  final TextEditingController controller;
  final String name, hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
              hintText: hint,
            ),
          ),
        ],
      ),
    );
  }
}
