import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/navigator/router_class.dart';
import 'package:musicapp/ui/screen/local_music_screen/album_detail_in_device.dart';

class AlbumDeviceidget extends StatelessWidget {
  List<AlbumInfo> albumInfo;
  AlbumDeviceidget({this.albumInfo});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: albumInfo.length,
        itemBuilder: (context, ind) {
          AlbumInfo album = albumInfo[ind];
          return InkWell(
            onTap: () {
              RouterClass.routerClass.pushWidget(AlbumDetailLocal(
                albumInfo: album,
              ));
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
                      album.title,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      album.numberOfSongs + ' Songs',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
          );
        });
  }
}
