import 'dart:async';
import 'package:zoho_clone/constants/constants.dart';
import 'package:zoho_clone/providers/stopwatch2.dart';
import 'package:zoho_clone/providers/stopwatch_provider.dart';
import 'package:zoho_clone/providers/times_provider.dart';
import 'package:zoho_clone/widgets/time_container.dart';
import 'package:flutter/material.dart';
import 'package:zoho_clone/constants/color_constants.dart';
import 'package:zoho_clone/constants/text_constants.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}


class _HomePageBodyState extends State<HomePageBody> {
  Container colon() {
    return Container(
      padding: const EdgeInsets.all(5),
      child: const Text(
        ':',
        style: TextStyle(fontSize: 40, color: greyColor),
      ),
    );
  }

  @override
  void initState() {
    Provider.of<Stopwatch2>(context, listen: false).getIntValuesSF();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final timeProvider = Provider.of<TimesProvider>(context);
    // final stopWatchProvider =
    //     Provider.of<StopwatchProvider>(context);
    final stopWatch = Provider.of<Stopwatch2>(context);
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
            color: containerColor, borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[sunIcon],
            ),
            Consumer<Stopwatch2>(
              builder: ((context, value, child) {
                stopWatch.addIntToSF(t: Time.hour, duration: value.hour);
                stopWatch.addIntToSF(t: Time.minute, duration: value.minute);
                stopWatch.addIntToSF(t: Time.second, duration: value.seconds);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TimeContainer(
                      time: value.hour.toString().padLeft(2, '0'),
                    ),
                    colon(),
                    TimeContainer(
                      time: value.minute.toString().padLeft(2, '0'),
                    ),
                    colon(),
                    TimeContainer(
                      time: value.seconds.toString().padLeft(2, '0'),
                    )
                  ],
                );
              }),
            ),
            const Divider(
              thickness: 5,
              color: greyColor,
            ),
            const Text(
              'General 09:00 AM to 09:00 PM',
              style: TextStyle(fontSize: 15, color: greyColor),
            ),
            GestureDetector(
              onTap: () {
                if (stopWatch.isStarted == false &&
                    stopWatch.isStopped == false) {
                  stopWatch.startTimer();
                  timeProvider.toCheckedIn(
                      DateFormat.jm().format(DateTime.now()).toString(),
                      DateFormat('dd-MMM-yyyy').format(DateTime.now()));
                } else if (stopWatch.isStopped) {
                  stopWatch.continueTimer();
                  timeProvider.toCheckedIn(
                      DateFormat.jm().format(DateTime.now()).toString(),
                      DateFormat('dd-MMM-yyyy').format(DateTime.now()));
                } else {
                  stopWatch.stopTimer();
                  timeProvider.toCheckedOut(
                      DateFormat.jm().format(DateTime.now()).toString(),
                      DateFormat('dd-MMM-yyyy').format(DateTime.now()));
                }
              },
              child: Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: !Provider.of<Stopwatch2>(context).isStarted
                        ? checkInColor
                        : checkOutColor,
                  ),
                  child: Center(
                    child: Text(
                      Provider.of<Stopwatch2>(context).isStarted
                          ? checkOutText
                          : checkInText,
                      style: buttonTextStyle,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
