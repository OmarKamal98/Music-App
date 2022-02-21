import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:musicapp/ui/widget/component/album_device_widget.dart';
import 'package:musicapp/ui/widget/component/artist_device_widget.dart';
import 'package:musicapp/ui/widget/component/song_card_widget.dart';

class SongsProvider extends ChangeNotifier {
  SongsProvider() {
    getSongFromDevice();
    getArtistFromDevice();
    getAlbumFromDevice();
  }
  List<SongInfo> allSong = [];
  List<SongInfo> songInAlbum = [];

  getSongFromDevice() {
    return FutureBuilder(
      future:
          FlutterAudioQuery().getSongs(sortType: SongSortType.ALPHABETIC_ALBUM),
      builder: (context, snapshot) {
        allSong = snapshot.data;
        if (snapshot.hasData) return SongWidget(songList: allSong);
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Loading".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  getAlbumFromDevice() {
    return FutureBuilder(
      future: FlutterAudioQuery().getAlbums(),
      builder: (context, snapshot) {
        List<AlbumInfo> albumInfo = snapshot.data;
        if (snapshot.hasData)
          return AlbumDeviceidget(
            albumInfo: albumInfo,
          );
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Loading....",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  getArtistFromDevice() {
    return FutureBuilder(
      future: FlutterAudioQuery().getArtists(),
      builder: (context, snapshot) {
        List<ArtistInfo> artistInfo = snapshot.data;
        if (snapshot.hasData)
          return ArtisteDeviceWidget(
            artistsInfo: artistInfo,
          );
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Loading....",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  getPlayListFromDevice() {}
  getSongFromAlbum(AlbumInfo albumInfo) {
    return FutureBuilder(
      future: FlutterAudioQuery().getSongsFromAlbum(albumId: albumInfo.id),
      builder: (context, data1) {
        songInAlbum = data1.data;
        return SongWidget(
          songList: songInAlbum,
        );
      },
    );
  }
}
