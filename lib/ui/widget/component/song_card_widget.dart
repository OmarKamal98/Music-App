import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:musicapp/navigator/router_class.dart';
import 'package:musicapp/ui/screen/main_screen/player_screen.dart';
import 'package:musicapp/ui/widget/component/component.dart';

Duration _position = new Duration();
final AudioPlayer audioPlayer = AudioPlayer();
bool isPlaying = false;

// audioPlayer.positionHandler = (p) => setState(() {
// _position = p;
// });

class SongWidget extends StatelessWidget {
  final List<SongInfo> songList;
  SongWidget({this.songList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 10),
            shrinkWrap: true,
            itemExtent: 70.0,
            itemCount: songList?.length ?? 0,
            itemBuilder: (context, index) {
              SongInfo song = songList[index];
              return Card(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  leading: InkWell(
                    onTap: () {
                      if (!isPlaying) {
                        audioPlayer.play('file://${song.filePath}',
                            isLocal: true);
                        isPlaying = true;
                      } else {
                        audioPlayer.stop();
                        isPlaying = false;
                      }
                      RouterClass.routerClass.pushWidget(PlayerScreen(song));
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: AssetImage('assets/images/cover.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  title: Text(song.title,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)
                      // overflow: TextOverflow.ellipsis,
                      ),
                  subtitle: Text(song.artist,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  trailing: PopupMenuButton(
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
                            log('showed dialog');
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
                ),
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
}

// AudioManager audioManagerInstance = AudioManager.instance;
// bool showVol = false;
// PlayMode playMode = audioManagerInstance.playMode;
// bool isPlaying = false;
// double _slider;
