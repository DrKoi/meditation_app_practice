import 'package:flutter/material.dart';

class HomeMeditationPage extends StatelessWidget {
  const HomeMeditationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditación'),
      ),
      body: Center(child: Text('Hola Mundo de la meditación')),
    );
  }
}
