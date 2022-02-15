import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class PlaylistDeviceidget extends StatelessWidget {
  List<PlaylistInfo> playlistsInfo;
  PlaylistDeviceidget({this.playlistsInfo});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: playlistsInfo?.length ?? 0,
        itemBuilder: (context, ind) {
          PlaylistInfo playlistInfo = playlistsInfo[ind];
          return InkWell(
            onTap: () {
              // RouterClass.routerClass.pushWidget(AlbumDetailLocal(
              //   albumInfo: album,
              // ));
            },
            child: Container(
              width: 100,
              height: 73,
              child: Card(
                  elevation: 2,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    leading: Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage('assets/images/cover.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    title: Text(
                      playlistInfo.name,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      playlistInfo.creationDate.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
          );
        });
  }
}
