import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Time { hour, minute, second }

class Stopwatch2 extends ChangeNotifier {
  Timer? _timer;
  int _hour = 0;
  int _minute = 0;
  int _seconds = 0;
  bool _isStarted = false;
  bool _isStopped = false;

  int get hour => _hour;
  int get minute => _minute;
  int get seconds => _seconds;
  bool get isStarted => _isStarted;
  bool get isStopped => _isStopped;
  SharedPreferences? prefs;

  // clearSF() {
  //   prefs!.clear();
  // }

  // addIntToSF({required Time t, required int duration}) async {
  //   prefs = await SharedPreferences.getInstance();
  //   await prefs!.setInt(t.toString(), duration);
  // }

  // addBoolToSF({required String key, required bool value}) async {
  //   prefs = await SharedPreferences.getInstance();
  //   await prefs!.setBool(key, value);
  //   notifyListeners();
  // }

  // Future<void> getBoolValuesSF() async {
  //   prefs = await SharedPreferences.getInstance();
  //   _isStarted = prefs!.getBool('isStarted')!;
  //   _isStopped = prefs!.getBool('isStopped')!;
  //   notifyListeners();
  // }

  // Future<bool> getIntValuesSF() async {
  // prefs = await SharedPreferences.getInstance();
  //   _hour = prefs!.getInt(Time.hour.toString())??0;
  //   _minute = prefs!.getInt(Time.minute.toString())??0;
  //   _seconds = prefs!.getInt(Time.second.toString())??0;
  //   notifyListeners();
  //   if(_hour == 0 && _minute == 0 && _seconds ==0 ){
  //     return false;
  //   }
  //   return true;
  // }

  void handelStopWatch() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds < 59) {
        _seconds++;
      } else if (_seconds == 59) {
        _seconds = 0;
        if (_minute == 59) {
          _minute = 0;
          _hour++;
        } else {
          _minute++;
        }
      }
      notifyListeners();
    });
  }

  void startTimer() {
    _isStarted = true;
    _isStopped = false;
    handelStopWatch();
  }

  void stopTimer() {
    if (_isStarted == true) {
      _isStarted = false;
      _isStopped = true;
      _timer!.cancel();
      notifyListeners();
    }
  }

  void continueTimer() {
    _isStopped = false;
    _isStarted = true;
    handelStopWatch();
  }
}
