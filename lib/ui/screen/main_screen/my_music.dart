import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:musicapp/ui/widget/component/artist_device_widget.dart';
import 'package:musicapp/ui/widget/component/playlist_device_widget.dart';
import 'package:musicapp/ui/widget/component/song_card_widget.dart';
import 'package:musicapp/ui/widget/gradient_containers.dart';
import '../../widget/component/album_device_widget.dart';

List<SongInfo> songs = [];

class MyMusicScreen extends StatefulWidget {
  @override
  State<MyMusicScreen> createState() => _MyMusicScreenState();
}

class _MyMusicScreenState extends State<MyMusicScreen> {
  void initState() {
    super.initState();
    // setupAudio();
  }

  // void setupAudio() {
  //   audioManagerInstance.onEvents((events, args) {
  //     switch (events) {
  //       case AudioManagerEvents.start:
  //         _slider = 0;
  //         break;
  //       case AudioManagerEvents.seekComplete:
  //         _slider = audioManagerInstance.position.inMilliseconds /
  //             audioManagerInstance.duration.inMilliseconds;
  //         setState(() {});
  //         break;
  //       case AudioManagerEvents.playstatus:
  //         isPlaying = audioManagerInstance.isPlaying;
  //         setState(() {});
  //         break;
  //       case AudioManagerEvents.timeupdate:
  //         _slider = audioManagerInstance.position.inMilliseconds /
  //             audioManagerInstance.duration.inMilliseconds;
  //         audioManagerInstance.updateLrc(args["position"].toString());
  //         setState(() {});
  //         break;
  //       case AudioManagerEvents.ended:
  //         audioManagerInstance.next();
  //         setState(() {});
  //         break;
  //       default:
  //         break;
  //     }
  //   });
  // }

  TabController tabController;

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  title: Text('myMusic'.tr()),
                  bottom: TabBar(
                    isScrollable: true,
                    controller: tabController,
                    tabs: [
                      Tab(
                        text: 'songs'.tr(),
                      ),
                      Tab(
                        text: 'albums'.tr(),
                      ),
                      Tab(
                        text: 'Artist'.tr(),
                      ),
                      Tab(
                        text: 'Playlist'.tr(),
                      ),
                    ],
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.black,
                  elevation: 5,
                ),
                body: TabBarView(
                  // physics: const CustomPhysics(),
                  controller: tabController,
                  children: [
                    GetSongFromDevice(),
                    GetAlbumFromDevice(),
                    GetArtistFromDevice(),
                    GetPlayListFromDevice()
                  ],
                ),
              ),
            ),
          ),
          // const MiniPlayer(),****************************************************************************************************
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class GetSongFromDevice extends StatelessWidget {
  List<SongInfo> allSong = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0B1F),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 620,
              child: FutureBuilder(
                future: FlutterAudioQuery()
                    .getSongs(sortType: SongSortType.ALPHABETIC_ALBUM),
                builder: (context, snapshot) {
                  List<SongInfo> songInfo = snapshot.data;
                  songs = songInfo;
                  allSong = snapshot.data;
                  if (snapshot.hasData) return SongWidget(songList: songInfo);
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
              ),
            ),
            // bottomPanel(),
          ],
        ),
      ),
    );
  }
}

class GetAlbumFromDevice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0B1F),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 500,
              child: FutureBuilder(
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
              ),
            ),
            // bottomPanel(),
          ],
        ),
      ),
    );
  }
}

class GetArtistFromDevice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0B1F),
      body: SingleChildScrollView(
        child: Container(
          height: 500,
          child: FutureBuilder(
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
          ),
        ),
        // bottomPanel(),
      ),
    );
  }
}

class GetPlayListFromDevice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF0E0B1F),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 500,
              child: FutureBuilder(
                future: FlutterAudioQuery().getPlaylists(),
                builder: (context, snapshot) {
                  List<PlaylistInfo> playlistInfo = snapshot.data;

                  return playlistInfo?.length != 0
                      ? PlaylistDeviceidget(playlistsInfo: playlistInfo)
                      : Container(
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        );
                },
              ),
            ),
            // bottomPanel(),
          ],
        ),
      ),
    );
  }
}
