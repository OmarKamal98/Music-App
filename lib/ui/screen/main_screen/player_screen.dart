import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/ui/widget/component/component.dart';
import 'package:musicapp/ui/widget/component/seek_bar.dart';
import 'package:musicapp/ui/widget/component/song_card_widget.dart';

class PlayerScreen extends StatefulWidget {
  SongInfo songInfo;
  PlayerScreen(this.songInfo, {Key key}) : super(key: key);

  @override
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  static String Parsetominsec(int ms) {
    String data;
    Duration duration = Duration(milliseconds: ms);
    int min = duration.inMinutes;
    int sec = (duration.inSeconds) - (min * 60);
    data = min.toString() + ":" + sec.toString();

    return data;
  }

  String currentTime = "00:00";
  String completeTime = "00:00";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color pageColor = Color(0xFF0E0B1F);
    return Scaffold(
      backgroundColor: pageColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.expand_more_rounded),
          tooltip: "back",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            onSelected: (int value) {},
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: InkWell(
                  onTap: () {
                    playListInputDialog(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.playlist_add,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        'addToPlaylist',
                      ),
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    const Icon(
                      Icons.album_rounded,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      'viewAlbum',
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 3,
                child: Row(
                  children: [
                    Icon(
                      Icons.info_rounded,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      'songInfo',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 16.h, left: 20.w, right: 20.w),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash1.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: 22.h),
          Padding(
            padding: EdgeInsets.only(left: 39.w, right: 39.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: 200,
                    child: Text(
                      widget.songInfo.title,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.download_outlined,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            widget.songInfo.artist,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 50.h),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 36.w),
          //   child:
          //
          //   // SeekBar(duration: duration, position: position)
          //   // Slider(
          //   //     value: position?.inMilliseconds?.toDouble() ?? 0.0,
          //   //     onChanged: (double value) {
          //   //       return audioPlayer.seek((value / 1000.0).roundToDouble());
          //   //     },
          //   //     min: 0.0,
          //   //     max: duration.inMilliseconds.toDouble()),
          //   // child: SliderTheme(
          //   //   data:
          //   //       SliderThemeData(overlayShape: SliderComponentShape.noOverlay),
          //   //   child: Slider(
          //   //       // value: ,
          //   //       min: 0.0,
          //   //       max: int.parse(
          //   //               Parsetominsec(int.parse(widget.songInfo.duration)))
          //   //           .toDouble(),
          //   //       divisions: 2100,
          //   //       activeColor: Colors.white,
          //   //       inactiveColor: const Color(0x4fffffff),
          //   //       label: '${valueHolder.round()}',
          //   //       onChanged: (double newValue) {
          //   //         setState(() {
          //   //           valueHolder = newValue.round();
          //   //           audioPlayer.seek(Duration(milliseconds: valueHolder));
          //   //         });
          //   //       },
          //   //       semanticFormatterCallback: (double newValue) {
          //   //         return '${newValue.round()}';
          //   //       }),
          //   // ),
          // ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentTime,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  Parsetominsec(int.parse(widget.songInfo.duration)),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.only(left: 42.w, right: 42.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.shuffle_outlined, color: Colors.white),
                Icon(Icons.skip_previous_outlined, color: Colors.white),
                Container(
                  width: 74.w,
                  height: 74.w,
                  child: IconButton(
                    onPressed: () {
                      if (isPlaying) {
                        audioPlayer.pause();
                        setState(() {
                          isPlaying = false;
                        });
                      } else {
                        audioPlayer.resume();

                        setState(() {
                          isPlaying = true;
                        });
                      }
                    },
                    icon: Icon(
                      isPlaying
                          ? Icons.pause_circle_filled_outlined
                          : Icons.play_circle_fill,
                      color: Colors.white,
                      size: 75,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.skip_next_outlined, color: Colors.white)),
                Icon(Icons.repeat, color: Colors.white),
              ],
            ),
          ),
          SizedBox(height: 39.h),
        ],
      ),
    );
  }
}
