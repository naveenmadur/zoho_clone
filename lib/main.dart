import 'package:flutter/material.dart';
import 'package:zoho_clone/providers/stopwatch2.dart';
import 'package:zoho_clone/providers/times_provider.dart';
import 'package:zoho_clone/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TimesProvider>(create: ((context) => TimesProvider()),),
        ChangeNotifierProvider<Stopwatch2>(create: ((context) => Stopwatch2()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}


