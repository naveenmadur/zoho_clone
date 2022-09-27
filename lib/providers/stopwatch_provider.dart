import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zoho_clone/models/times_class.dart';

class StopwatchProvider extends ChangeNotifier {
  final Stopwatch _stopwatch = Stopwatch();

  String hour = '00';
  String minute = '00';
  String second = '00';
  Timer? _timer;
  bool isStarted = false;

  void handelStartStop() {
    if (_stopwatch.isRunning) {
      isStarted = false;
      _stopwatch.stop();
      notifyListeners();
    } else {
      _stopwatch.start();
      isStarted = true;
      _timer = Timer.periodic(const Duration(microseconds: 1), (timer) {
        second = (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
        minute = (_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0');
        hour = (_stopwatch.elapsed.inHours).toString().padLeft(2, '0');
        notifyListeners();
      });
    }
  }
}
