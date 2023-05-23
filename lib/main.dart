import 'dart:html';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool play_pause = true;
  int result = 0;
  AudioPlayer audioPlayer = AudioPlayer();
  List my_playlist = [
    {
      "url" : "music/DH.mp3",
      "image" : "images/Diamond.jpg",
      "name" : "",
      "artist" : "",
    },
    {
      "url" : "music/FT.mp3",
      "image" : "images/Fairy_tail.webp",
      "name" : "",
      "artist" : "",
    },
    {
      "url" : "music/NL.mp3",
      "image" : "images/nolie.jpg",
      "name" : "",
      "artist" : "",
    }
  ];
  
  play() async{
   await audioPlayer.play(my_playlist[result]);
  }
  pause() async{
    await audioPlayer.pause();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image(image: AssetImage('images/my_playlist[image]'),width: 150,height: 150,),
            IconButton(onPressed: () {
              if(play_pause){
                play();
              }else{
                pause();
              }
              setState(() {
                play_pause = !play_pause;
              });
            }, icon:
             play_pause  ? const Icon(Icons.play_arrow) : const  Icon(Icons.pause)
            ),
            IconButton(onPressed: (){
              if (result == 2 ){
                pause();
                setState(() {
                  play_pause = true;
                  result = 0;
                });
              }else{
              pause();
              setState(() {
                play_pause = true;
                result += 0;
              });
            }
            },
             icon: Icon(Icons.skip_next))
          ],  
        ),
      ),
    );
  }
}
