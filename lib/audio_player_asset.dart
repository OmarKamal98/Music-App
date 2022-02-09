import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayAudioAssets extends StatefulWidget {
  @override
  State<PlayAudioAssets> createState() => _PlayAudioAssetsState();
}

class _PlayAudioAssetsState extends State<PlayAudioAssets> {
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState;
  AudioCache audioCache;
  String path = 'song/music.mp3';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearAll();
  }

  playMusic() async {
    await audioCache.play(path);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  audioPlayerState == PlayerState.PLAYING
                      ? pauseMusic()
                      : playMusic();
                },
                icon: audioPlayerState == PlayerState.PLAYING
                    ? Icon(Icons.pause)
                    : Icon(Icons.play_arrow)),
          ],
        ),
      ),
    );
  }
}
