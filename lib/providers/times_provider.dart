import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zoho_clone/models/times_class.dart';
import 'dart:convert';

class TimesProvider extends ChangeNotifier{

  List<Times> _checkInTimes = [];
  List<Times> _checkOutTimes = [];

  List<Times> get checkInTimes {
    return [..._checkInTimes];
  }

  List<Times> get checkOutTimes {
    return [..._checkOutTimes];
  }


  Future<void> toCheckedIn(String t, String date) async {
    final url = Uri.parse(
        'https://zohoclone-default-rtdb.firebaseio.com/times/checkInTimes.json');
    final response = await http.post(
      url,
      body: json.encode({
        'time': t,
        'date': date,
      }),
    );
    final newTime =
        Times(id: jsonDecode(response.body)['name'], time: t, date: date);
    _checkInTimes.add(newTime);
    notifyListeners();
  }


  Future<void> toCheckedOut(String t, String date) async {
    final url = Uri.parse(
        'https://zohoclone-default-rtdb.firebaseio.com/times/checkOutTimes.json');

    final response = await http.post(
      url,
      body: json.encode({
        'time': t,
        'date': date,
      }),
    );
    final newTime =
        Times(id: jsonDecode(response.body)['name'], time: t, date: date);
    _checkOutTimes.add(newTime);
    notifyListeners();
  }

  Future<void> fromJson() async {
    final checkInUrl = Uri.parse(
        'https://zohoclone-default-rtdb.firebaseio.com/times/checkInTimes.json');
    final checkOutUrl = Uri.parse(
        'https://zohoclone-default-rtdb.firebaseio.com/times/checkOutTimes.json');
    try {
      final checkInResponse = await http.get(checkInUrl);
      final checkOutResponse = await http.get(checkOutUrl);
      final List<Times> loadedCheckInTimes = [];
      final List<Times> loadedCheckOutTimes = [];
      final checkInData =
          json.decode(checkInResponse.body) as Map<String, dynamic>?;
      final checkOutData =
          json.decode(checkOutResponse.body) as Map<String, dynamic>?;

      if (checkInData == null || checkOutData == null) {
        return;
      }
      checkInData.forEach((key, value) {
        loadedCheckInTimes.add(
          Times(id: key, time: value['time'], date: value['date']),
        );
      });
      checkOutData.forEach(((key, value) {
        loadedCheckOutTimes
            .add(Times(id: key, time: value['time'], date: value['date']));
      }));
      _checkInTimes = loadedCheckInTimes;
      _checkOutTimes = loadedCheckOutTimes;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }



}