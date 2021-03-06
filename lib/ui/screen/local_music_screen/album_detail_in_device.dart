import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/navigator/router_class.dart';
import 'package:musicapp/provider/songs_provider.dart';
import 'package:musicapp/ui/widget/component/component.dart';
import 'package:musicapp/ui/widget/component/seekbar_controlbuttons.dart';
import 'package:musicapp/ui/widget/component/song_card_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AlbumDetailLocal extends StatelessWidget {
  AlbumInfo albumInfo;
  AlbumDetailLocal({this.albumInfo});
  @override
  Widget build(BuildContext context) {
    playingsongs = Provider.of<SongsProvider>(context).songInAlbum;
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Color(0xFF0E0B1F),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: 64.h,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      playingsongs =
                          Provider.of<SongsProvider>(context).allSong;
                      RouterClass.routerClass.popFunction();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.white,
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 90.w),
                  child: Container(
                    width: 100.w,
                    child: Text(
                      albumInfo.title,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: searchField(function: () {}),
            ),
            Container(
              height: 600,
              child: Provider.of<SongsProvider>(context)
                  .getSongFromAlbum(albumInfo),
            )
          ],
        ),
      ),
    );
  }
}
