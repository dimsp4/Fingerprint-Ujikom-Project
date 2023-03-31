import 'package:flutter/material.dart';

class ScheduleTile extends StatelessWidget {
  const ScheduleTile({
    Key? key,
    required this.scheduleName,
    required this.kelas,
    required this.date,
  }) : super(key: key);

  final String scheduleName, kelas, date;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        title: Text(
          scheduleName,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        ),
        subtitle: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$kelas\n',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: date,
              ),
            ],
          ),
        ),
        minVerticalPadding: 20,
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.keyboard_arrow_right,
              size: 25,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
