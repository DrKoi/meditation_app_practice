import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meditation_app/constants.dart';
import '../models/item_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:bordered_text/bordered_text.dart';

class HomeMeditationPage extends StatefulWidget {
  const HomeMeditationPage({Key? key}) : super(key: key);

  @override
  State<HomeMeditationPage> createState() => _HomeMeditationPageState();
}

class _HomeMeditationPageState extends State<HomeMeditationPage> {
  final AudioPlayer audioPlayer = new AudioPlayer();

  List<Item> items = [
    Item(
        name: 'Sonidos del Bosque',
        imagePath: 'meditation_images/forest.jpeg',
        audioPath: 'meditation_audios/forest.mp3'),
    Item(
        name: 'Noche profunda',
        imagePath: 'meditation_images/night.jpeg',
        audioPath: 'meditation_audios/night.mp3'),
    Item(
        name: 'Brisa Oceánica',
        imagePath: 'meditation_images/ocean.jpeg',
        audioPath: 'meditation_audios/ocean.mp3'),
    Item(
        name: 'Cascada',
        imagePath: 'meditation_images/waterfall.jpeg',
        audioPath: 'meditation_audios/waterfall.mp3'),
    Item(
        name: 'Tarde de viento',
        imagePath: 'meditation_images/wind.jpeg',
        audioPath: 'meditation_audios/wind.mp3')
  ];

  int? _sonandoIndice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meditación'),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(items[index].imagePath))),
                  child: ListTile(
                    leading: BorderedText(
                      strokeWidth: 4,
                      strokeColor: Colors.black,
                      child: Text(
                        items[index].name,
                        style: kGoogleTxtCaption,
                      ),
                    ),
                    trailing: IconButton(
                      icon: _sonandoIndice == index
                          ? Icon(
                              MdiIcons.stopCircleOutline,
                              size: 40,
                            )
                          : Icon(MdiIcons.playCircleOutline, size: 40),
                      onPressed: () async {
                        if (_sonandoIndice == index) {
                          setState(() {
                            _sonandoIndice = null;
                          });

                          audioPlayer.stop();
                        } else {
                          try {
                            await audioPlayer.setAsset(items[index].audioPath);
                            audioPlayer.setLoopMode(LoopMode.one);
                            audioPlayer.play();
                            setState(() {
                              _sonandoIndice = index;
                            });
                          } catch (error) {
                            print(error);
                          }
                        }
                      },
                    ),
                    /* Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: Icon(
                              MdiIcons.play,
                            ),
                            onPressed: () {
                              audioPlayer.setAsset(items[index].audioPath);
                              audioPlayer.setLoopMode(LoopMode.one);
                              audioPlayer.play();
                            }),
                        IconButton(
                            icon: Icon(MdiIcons.stop),
                            onPressed: () {
                              audioPlayer.setAsset(items[index].audioPath);
                              audioPlayer.stop();
                            }),
                      ],
                    ), */
                  ),
                ),
              );
            },
          ),
        ));
  }
}
