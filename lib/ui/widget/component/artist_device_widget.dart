import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/navigator/router_class.dart';
import 'package:musicapp/ui/screen/local_music_screen/artist_detail_in_device.dart';

class ArtisteDeviceWidget extends StatelessWidget {
  List<ArtistInfo> artistsInfo = [];
  ArtisteDeviceWidget({this.artistsInfo});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: artistsInfo.length,
        itemBuilder: (context, ind) {
          ArtistInfo artistInfo = artistsInfo[ind];
          return InkWell(
            onTap: () {
              RouterClass.routerClass.pushWidget(ArtistDetailLocal(
                artistInfo: artistInfo,
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
                  child: Center(
                    child: ListTile(
                      leading: Container(
                        clipBehavior: Clip.antiAlias,
                        alignment: Alignment.center,
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blueAccent,
                        ),
                        child: Text(
                          artistInfo.name[0],
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.white, fontSize: 25.sp),
                        ),
                      ),
                      title: Text(
                        artistInfo.name,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                  )),
            ),
          );
        });
  }
}
