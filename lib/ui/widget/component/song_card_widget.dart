import 'package:audio_manager/audio_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:musicapp/navigator/router_class.dart';

class SongWidget extends StatelessWidget {
  final List<SongInfo> songList;
  SongWidget({this.songList});
  bool isStarted = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PlaylistHead(
        //   songsList: widget.songs,
        //   offline: true,
        //   fromDownloads: false,
        //   recommend: false,
        // ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 10),
            shrinkWrap: true,
            itemExtent: 70.0,
            itemCount: songList.length,
            itemBuilder: (context, index) {
              SongInfo song = songList[index];
              return ListTile(
                leading: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: const Image(
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                    image: AssetImage('assets/images/splash1.png'),
                  ),
                ),
                title: Text(song.title,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)
                    // overflow: TextOverflow.ellipsis,
                    ),
                onTap: () {
                  isStarted = !isStarted;
                  if (isStarted) {
                    AudioManager.instance.start(
                        'file://${song.filePath}', 'title',
                        desc: 'desc', cover: 'cover');
                  } else if (isStarted) {
                    AudioManager.instance.stop();
                  }
                },
              );
            },
          ),
        ),
      ],
    );
    // return ListView.builder(
    //     itemCount: songList.length,
    //     itemBuilder: (context, songIndex) {
    //       SongInfo song = songList[songIndex];
    //       if (song.displayName.contains(".mp3")) {
    //         // return Card(
    //         //   elevation: 5,
    //         //   child: Padding(
    //         //     padding: const EdgeInsets.all(8.0),
    //         //     child: Row(
    //         //       children: [
    //         //         Container(
    //         //           width: MediaQuery.of(context).size.width * .9,
    //         //           padding: EdgeInsets.all(8),
    //         //           child: Row(
    //         //             mainAxisAlignment: MainAxisAlignment.center,
    //         //             children: [
    //         //               Column(
    //         //                 mainAxisAlignment: MainAxisAlignment.center,
    //         //                 crossAxisAlignment: CrossAxisAlignment.center,
    //         //                 children: [
    //         //                   Container(
    //         //                     width: MediaQuery.of(context).size.width * .7,
    //         //                     child: Text(
    //         //                       song.title,
    //         //                       style: TextStyle(
    //         //                           fontSize: 15,
    //         //                           fontWeight: FontWeight.w700),
    //         //                     ),
    //         //                   ),
    //         //                   Text(
    //         //                     "Realse year ${song.year}",
    //         //                     style: TextStyle(
    //         //                         fontSize: 11,
    //         //                         color: Colors.grey,
    //         //                         fontWeight: FontWeight.w500),
    //         //                   ),
    //         //                   Text(
    //         //                     "Artist ${song.artist}",
    //         //                     style: TextStyle(
    //         //                         fontSize: 11,
    //         //                         color: Colors.grey,
    //         //                         fontWeight: FontWeight.w500),
    //         //                   ),
    //         //                   Text(
    //         //                     "Duration ${Parsetominsec(int.parse(song.duration))}",
    //         //                     style: TextStyle(
    //         //                         fontSize: 11,
    //         //                         color: Colors.grey,
    //         //                         fontWeight: FontWeight.w500),
    //         //                   ),
    //         //                 ],
    //         //               ),
    //         //               InkWell(
    //         //                   onTap: () async {
    //         //                     log('message:you are here');
    //         //                     await AudioManager.instance.start(
    //         //                         'file://${song.filePath}', 'title',
    //         //                         desc: 'desc', cover: 'cover');
    //         //                     log('message:you are here');
    //         //                   },
    //         //                   child: Icon(Icons.play_circle_outline))
    //         //             ],
    //         //           ),
    //         //         )
    //         //       ],
    //         //     ),
    //         //   ),
    //         // );
    //       }
    //       return SizedBox(
    //         height: 0,
    //       );
    //     });
  }

  static String Parsetominsec(int ms) {
    String data;
    Duration duration = Duration(milliseconds: ms);
    int min = duration.inMinutes;
    int sec = (duration.inSeconds) - (min * 60);
    data = min.toString() + ":" + sec.toString();

    return data;
  }
}

// AudioManager audioManagerInstance = AudioManager.instance;
// bool showVol = false;
// PlayMode playMode = audioManagerInstance.playMode;
// bool isPlaying = false;
// double _slider;
