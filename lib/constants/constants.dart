import 'package:flutter/material.dart';
import 'package:zoho_clone/constants/color_constants.dart';
import 'package:zoho_clone/screens/details_screen.dart';
import 'package:zoho_clone/screens/home_page_body.dart';

const EdgeInsetsGeometry appBarImageMargin = EdgeInsets.only(left: 10, bottom: 10);

const Image appBarImage = Image(fit: BoxFit.fill, image: NetworkImage('https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50'));

const List<Widget> appBarActionsList = [
  IconButton(icon: Icon(Icons.search, color: appBarIconColor), onPressed: null,),
              IconButton(icon: Icon(Icons.notifications_active, color: appBarIconColor,), onPressed: null,)
];

const List<Widget> bottomNavBarList = [
  HomePageBody(),
  DetailsScreen(),
];
const Icon closeIcon =  Icon(Icons.close,color: iconColor,);

