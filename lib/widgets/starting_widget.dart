import 'package:flutter/material.dart';
import 'package:zoho_clone/constants/color_constants.dart';
import 'package:zoho_clone/constants/constants.dart';
import 'package:zoho_clone/constants/text_constants.dart';

class StartingWidget extends StatelessWidget {
  const StartingWidget({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: closeButtonBorderRadius,
            color:  containerColor,
          ),
          child: closeIcon,
        ),
        Expanded(
          child: ListTile(
            title: Text(
              date,
              style: startingWidgetTextStyle,
              textAlign: TextAlign.center,
            ),
            subtitle: const Text(
              'Present',
              style: startingWidgetTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
