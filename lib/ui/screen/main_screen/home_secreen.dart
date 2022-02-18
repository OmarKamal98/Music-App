import 'dart:developer';
import 'package:just_audio/just_audio.dart';
import 'package:blur/blur.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:musicapp/data/api/dio_client.dart';
import 'package:musicapp/provider/api_provider.dart';
import 'package:musicapp/provider/songs_provider.dart';
import 'package:musicapp/ui/widget/component/seekbar_controlbuttons.dart';
import 'package:musicapp/ui/widget/component/song_card_widget.dart';
import 'package:provider/provider.dart';

final _player1 = AudioPlayer();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50.h, left: 25.w, right: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'musical'.tr(),
                    style: TextStyle(
                        fontSize: 48.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25.h, left: 25.w, right: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'NewAlbums'.tr(),
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Viewall'.tr(),
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 17.h),
              child: GestureDetector(
                child: SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 15),
                            child: Image.asset('assets/images/splash1.png')
                                .blurred(
                              colorOpacity: 0.2,
                              borderRadius: BorderRadius.circular(25),
                              blur: 20,
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 15, right: 15),
                              child: Image.asset('assets/images/cover.jpg')
                                  .blurred(
                                borderRadius: BorderRadius.circular(27),
                                blur: 0,
                                colorOpacity: 0.0,
                              ))
                        ],
                      );
                    },
                    itemCount: 5,
                    viewportFraction: 0.4,
                    scale: 1,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              margin: EdgeInsets.only(top: 25.h, left: 25.w, right: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'TopAlbums'.tr(),
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Viewall'.tr(),
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 17.h),
              child: GestureDetector(
                child: SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 15),
                            child: Image.asset('assets/images/splash1.png')
                                .blurred(
                              colorOpacity: 0.2,
                              borderRadius: BorderRadius.circular(25),
                              blur: 20,
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 15, right: 15),
                              child: Image.asset('assets/images/cover.jpg')
                                  .blurred(
                                borderRadius: BorderRadius.circular(27),
                                blur: 0,
                                colorOpacity: 0.0,
                              ))
                        ],
                      );
                    },
                    itemCount: 5,
                    viewportFraction: 0.4,
                    scale: 1,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "PopularMusic".tr(),
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  DioClient.dioClient.getAlbumsAPI();
                },
                child: Text(
                  'Get Tracks',
                  style: TextStyle(color: Colors.white),
                )),
            Container(
              height: 500,
              color: Color(0xFF0E0B1F),
              child: Consumer<APIProvider>(builder: (context, provider, x) {
                return provider.items.length == 0
                    ? Center(
                        child: Text(
                          'Error get Tracks',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: provider.items.length,
                              itemBuilder: (context, position) {
                                return InkWell(
                                  onTap: () async {
                                    await _player1.setAudioSource(
                                        AudioSource.uri(Uri.parse(provider
                                            .items[position].previewUrl)));
                                    await _player1.play();
                                  },
                                  child: Card(
                                    child: ListTile(
                                      leading: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            image: DecorationImage(
                                                image: NetworkImage(provider
                                                    .albums[0]
                                                    .images
                                                    .first
                                                    .url),
                                                fit: BoxFit.cover)),
                                      ),
                                      title:
                                          Text(provider.items[position].name),
                                      subtitle: Text(provider
                                          .items[position].artists.first.name),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
