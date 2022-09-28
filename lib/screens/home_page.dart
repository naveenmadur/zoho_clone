import 'package:flutter/material.dart';
import 'package:zoho_clone/constants/color_constants.dart';
import 'package:zoho_clone/constants/constants.dart';
import 'package:zoho_clone/constants/text_constants.dart';
import 'package:zoho_clone/screens/details_screen.dart';
import 'package:zoho_clone/screens/home_page_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _index = index;
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: Container(
            margin: appBarImageMargin,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(18), child: appBarImage)),
        title: appBarText,
        actions: appBarActionsList,
        centerTitle: false,
      ),
      body: bottomNavBarList[_index],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: greyColor,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  color: greyColor,
                ),
                label: 'Details')
          ],
          currentIndex: _index,
          onTap: _onItemTapped),
    );
  }
}
