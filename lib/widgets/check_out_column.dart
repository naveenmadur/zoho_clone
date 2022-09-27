import 'package:flutter/material.dart';
import 'package:zoho_clone/widgets/date_icon_row.dart';
import 'package:zoho_clone/constants/text_constants.dart';

class CheckOutColumn extends StatelessWidget {
  const CheckOutColumn({
    Key? key,
    required this.date,
    required this.time,
    required this.color,
    required this.contains
  }) : super(key: key);

  final String date;
  final String time;
  final Color color;
  final bool contains;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        contains ? DateIconRow(date: date) : const Text(''),
        Text(
          time,
          style: TextStyle(color: color),
        ),
         contains ? const Text(
          'PUNE',
          style: detailsScreenTextStyle,
        ) : const Text('')
      ],
    );
  }
}
