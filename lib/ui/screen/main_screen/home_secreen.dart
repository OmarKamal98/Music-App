import 'package:blur/blur.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:musicapp/ui/widget/component/song_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  // List cardItems = [
  //   {
  //     "name": "Atif Aslam",
  //     "img": "https://i.ytimg.com/vi/a18py61_F_w/maxresdefault.jpg",
  //   },
  //   {
  //     "name": "Gul Panra",
  //     "img":
  //         "https://images.hungama.com/c/1/2d0/9d5/48481154/48481154_200x200.jpg"
  //   },
  //   {
  //     "name": "Momina",
  //     "img":
  //         "https://media.lyricsmint.com/photos/6254/ko-ko-korina-coke-studio-11-momina-mustehsan_cover.jpg"
  //   },
  //   {
  //     "name": "Atif Aslam",
  //     "img": "https://i.ytimg.com/vi/a18py61_F_w/maxresdefault.jpg"
  //   },
  //   {
  //     "name": "Gul Panra",
  //     "img":
  //         "https://images.hungama.com/c/1/2d0/9d5/48481154/48481154_200x200.jpg"
  //   },
  //   {
  //     "name": "Momina",
  //     "img":
  //         "https://media.lyricsmint.com/photos/6254/ko-ko-korina-coke-studio-11-momina-mustehsan_cover.jpg"
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                              borderRadius: BorderRadius.circular(5),
                              blur: 20,
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 15, right: 15),
                              child: Image.asset('assets/images/splash1.png')
                                  .blurred(
                                borderRadius: BorderRadius.circular(5),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(top: 25.h, left: 25.w, right: 24.w),
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
                        padding: EdgeInsets.only(top: 5.h),
                        child: GestureDetector(
                          child: SizedBox(
                            height: 120,
                            width: double.infinity,
                            child: Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 15),
                                      child: Image.asset(
                                              'assets/images/splash1.png')
                                          .blurred(
                                        colorOpacity: 0.2,
                                        borderRadius: BorderRadius.circular(5),
                                        blur: 20,
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 15, right: 15),
                                        child: Image.asset(
                                                'assets/images/splash1.png')
                                            .blurred(
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
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
                Container(
                  height: 400,
                  child: FutureBuilder(
                    future: FlutterAudioQuery()
                        .getSongs(sortType: SongSortType.ALPHABETIC_ALBUM),
                    builder: (context, snapshot) {
                      List<SongInfo> songInfo = snapshot.data;
                      if (snapshot.hasData)
                        return SongWidget(songList: songInfo);
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
