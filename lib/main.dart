import 'package:flutter/material.dart';
import 'package:meditation_app/pages/home_meditation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        backgroundColor: Colors.blueGrey,
        appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurple),
        listTileTheme: ListTileThemeData(
          iconColor: Colors.white70,
        ),
      ),
      home: HomeMeditationPage(),
    );
  }
}
