import 'package:flutter/material.dart';
import 'date_icon_row.dart';
import 'package:zoho_clone/constants/text_constants.dart';

class CheckInColumn extends StatelessWidget {
  const CheckInColumn({
    Key? key,
    required this.date,
    required this.time,
    required this.color,
  }) : super(key: key);

  final String date;
  final String time;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        DateIconRow(date: date),
        Text(
          time,
          style: TextStyle(color: color),
        ),
         const Text(
          'PUNE',
          style: detailsScreenTextStyle,
        )
      ],
    );
  }
}
