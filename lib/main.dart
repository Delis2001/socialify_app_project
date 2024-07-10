// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialify_app_project/providers/post_provider.dart';
import 'package:socialify_app_project/providers/user_provider.dart';
import 'package:socialify_app_project/screens/bottomnavbar.dart';
import 'package:socialify_app_project/screens/unboarding/other_home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => PostProvider(),),
         ChangeNotifierProvider(
        create: (context) => UserProvider(),)
    ],
    child:  MaterialApp(
          home: BottomNavBar()
       ),);
  }
}
