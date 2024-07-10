// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:socialify_app_project/screens/unboarding/home_screen.dart';
import 'package:socialify_app_project/screens/unboarding/other_home_screen.dart';
import 'package:socialify_app_project/screens/unboarding/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index =0;
  List<Widget> screens=[
    HomeScreen(),
    OtherHomeScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value){
           setState(() {
             index= value;
           });
          },
          currentIndex: index,
          showSelectedLabels: false,
          selectedIconTheme: IconThemeData(color: Colors.green,size: 40),
          items: [
         BottomNavigationBarItem(icon: Icon(Icons.home_sharp),label:'' ),
          BottomNavigationBarItem(icon: Icon(Icons.event_note_rounded),label:'' ),
           BottomNavigationBarItem(icon: Icon(Icons.person),label:'' )
      
        ]),
        body: screens[index],
      ),
    );
  }
}