import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:musicapp/provider/auth_provider.dart';
import 'package:musicapp/provider/songs_provider.dart';
import 'package:musicapp/ui/widget/component/artist_device_widget.dart';
import 'package:musicapp/ui/widget/component/playlist_device_widget.dart';
import 'package:musicapp/ui/widget/component/song_card_widget.dart';
import 'package:musicapp/ui/widget/gradient_containers.dart';
import 'package:provider/provider.dart';
import '../../widget/component/album_device_widget.dart';
import '../../widget/component/seekbar_controlbuttons.dart';

class MyMusicScreen extends StatefulWidget {
  @override
  State<MyMusicScreen> createState() => _MyMusicScreenState();
}

class _MyMusicScreenState extends State<MyMusicScreen> {
  void initState() {
    super.initState();
    // setupAudio();
  }

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
                  controller: tabController,
                  children: [
                    Container(
                      color: Color(0xFF0E0B1F),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 620,
                            child: Provider.of<SongsProvider>(context)
                                .getSongFromDevice(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Color(0xFF0E0B1F),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 620,
                            child: Provider.of<SongsProvider>(context)
                                .getAlbumFromDevice(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Color(0xFF0E0B1F),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 620,
                            child: Provider.of<SongsProvider>(context)
                                .getArtistFromDevice(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Color(0xFF0E0B1F),
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
                    )
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
