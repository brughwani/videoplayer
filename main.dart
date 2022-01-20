import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:bubble/bubble.dart';.
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
//import 'package:audio_service/audio_service.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:is_lock_screen/is_lock_screen.dart';
//import 'package:flutter_playout/audio.dart';
import 'package:flutter_playout/multiaudio/HLSManifestLanguage.dart';
//import 'package:flutter_playout/multiaudio/LanguageCode.dart';
//import 'package:flutter_playout/multiaudio/MultiAudioSupport.dart';
//import 'package:flutter_playout/player_observer.dart';
import 'package:flutter_playout/player_state.dart';
//import 'package:flutter_playout/textTrack.dart';
//import 'package:flutter_playout/video.dart';

void main()  {
  
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
           
            title: Text('Bible'),
          ),
          body:
            SafeArea(child: SamplePlayer()),

                 ),
        ),
      );
  }
}

class SamplePlayer extends StatefulWidget {
  SamplePlayer({Key key}) : super(key: key);

  @override
  _SamplePlayerState createState() => _SamplePlayerState();
}

class _SamplePlayerState extends State<SamplePlayer> {
  String url="https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8";
  FlickManager flickManager;
 StreamSubscription<FGBGType> subscription;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.network(url)
          
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool subscription = FGBGEvents.stream.isBroadcast;
    if(subscription==true)
    {
      print(subscription);
      print("1111111111111111111111111111111111111");
 return Container(
      child: FlickVideoPlayer(
      
        flickManager: flickManager,
       preferredDeviceOrientation: [
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft
        ],
        systemUIOverlay: [],
        flickVideoWithControls: FlickVideoWithControls(
          controls:FlickLandscapeControls()
      ),
    )
 );


    }
    else
    {
      print("000000000000000000000000000000");
      
    }
   
  }

}

 /*
  Future<bool> result = isLockScreen();
  PlayerState _desiredState = PlayerState.PLAYING;
  bool _showPlayerControls = true;
  StreamSubscription<FGBGType> subscription;
  @override
void didChangeAppLifecycleState(AppLifecycleState state) async {
  subscription = FGBGEvents.stream.listen((event)
  {
print(event);
  });

  //super.didChangeAppLifecycleState(state);
  if (state == AppLifecycleState.inactive) {
   // print('app inactive, is lock screen: ${await isLockScreen()}');
 

HLSManifestLanguage("123",url);

  } 
  else  
  {
     flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.network(url));
           @override
  Widget build(BuildContext context) {
    return Container(
      child: FlickVideoPlayer(
        flickManager: flickManager
      ),
    );
       
  }

}*/