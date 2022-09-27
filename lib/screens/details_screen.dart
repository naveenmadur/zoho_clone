import 'package:flutter/material.dart';
import 'package:zoho_clone/constants/color_constants.dart';
import 'package:zoho_clone/constants/text_constants.dart';
import 'package:intl/intl.dart';
import 'package:zoho_clone/providers/stopwatch_provider.dart';
import 'package:zoho_clone/providers/times_provider.dart';
import 'package:zoho_clone/widgets/starting_widget.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isInit = true;
  
  @override
  void didChangeDependencies() {
    Provider.of<TimesProvider>(context, listen: false).fromJson();
    setState(() {
    isInit = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final checkInTimes = Provider.of<TimesProvider>(context).checkInTimes;
    final checkOutTimes = Provider.of<TimesProvider>(context).checkOutTimes;
    String date = DateFormat('dd-MMM-yyyy').format(DateTime.now());
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          StartingWidget(date: date),
          SizedBox(
            height: MediaQuery.of(context).size.height/1.52,
            child: ListView.builder(
              itemBuilder: (context, index) => Tile(
                date: checkInTimes[index].date,
                checkInTime: checkInTimes[index].time,
                checkOutTime: checkOutTimes.asMap().containsKey(index) ? checkOutTimes[index].time : '-',
              ),
              itemCount: checkInTimes.length,
            ),
          ),
        ],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile(
      {Key? key,
      required this.date,
      required this.checkInTime,
      required this.checkOutTime})
      : super(key: key);

  final String date;
  final String checkInTime;
  final String checkOutTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: MediaQuery.of(context).size.height / 8,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TimeColumn(date: date, checkInTime: checkInTime),
          TimeColumn(date: date, checkInTime: checkOutTime)
        ],
      ),
    );
  }
}

class TimeColumn extends StatelessWidget {
  const TimeColumn({
    Key? key,
    required this.date,
    required this.checkInTime,
  }) : super(key: key);

  final String date;
  final String checkInTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(date, style: detailsScreenTextStyle),
            const Icon(
              Icons.mobile_friendly,
            )
          ],
        ),
        Text(
          checkInTime,
          style: TextStyle(color: Colors.green),
        ),
        const Text(
          'PUNE',
          style: detailsScreenTextStyle,
        )
      ],
    );
  }
}
