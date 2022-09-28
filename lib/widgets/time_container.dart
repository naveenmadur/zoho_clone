import 'package:flutter/material.dart';
import 'package:zoho_clone/constants/color_constants.dart';

class TimeContainer extends StatelessWidget {
  const TimeContainer({Key? key, required this.time}) : super(key: key);
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Color.fromRGBO(67, 67, 67, 1),
      ),
      height: MediaQuery.of(context).size.height / 12,
      width: MediaQuery.of(context).size.width / 6,
      child: Center(
          child: Text(
        time,
        style: TextStyle(
            fontSize: 30,
            color: Colors.grey.shade400,
            fontWeight: FontWeight.bold),
      )),
    );
  }
}
