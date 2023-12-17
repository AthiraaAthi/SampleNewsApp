import 'package:flutter/material.dart';
import 'package:news_app_api/controller/my_controller.dart';
import 'package:news_app_api/controller/search_controller.dart';
import 'package:news_app_api/view/home_Screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyNewsApp());
}

class MyNewsApp extends StatelessWidget {
  const MyNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Mycontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchDataController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
