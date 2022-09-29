import 'package:flutter/material.dart';

class HomeMeditationPageEjemplo extends StatefulWidget {
  const HomeMeditationPageEjemplo({Key? key}) : super(key: key);

  @override
  State<HomeMeditationPageEjemplo> createState() =>
      _HomeMeditationPageEjemploState();
}

class _HomeMeditationPageEjemploState extends State<HomeMeditationPageEjemplo> {
  final List<Widget> myContainers = [
    Container(height: 40, color: Colors.yellow),
    Container(height: 40, color: Colors.green),
    Container(height: 40, color: Colors.red),
    Container(height: 40, color: Colors.deepPurple),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meditación'),
        ),
        body: SafeArea(
          child: ListView.separated(
            itemCount: myContainers.length,
            itemBuilder: (BuildContext context, int index) {
              return myContainers[index];
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 50,
              );
            },
          ),
        ));
  }
}
