import 'package:flutter/material.dart';
import 'package:zoho_clone/constants/color_constants.dart';
import 'package:zoho_clone/constants/constants.dart';
import 'package:zoho_clone/constants/text_constants.dart';

class DateIconRow extends StatelessWidget {
  const DateIconRow({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(date, style: detailsScreenTextStyle),
        Container(
          margin: dateIconPadding ,
          child: const Icon(
            Icons.mobile_friendly,
            color: greyColor,
          ),
        )
      ],
    );
  }
}
