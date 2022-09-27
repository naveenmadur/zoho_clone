import 'package:flutter/material.dart';


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
        const CircleAvatar(
          backgroundColor: Colors.grey,
          child: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              date,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            subtitle: const Text(
              'Present',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
