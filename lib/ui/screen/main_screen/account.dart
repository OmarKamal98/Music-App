import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/navigator/router_class.dart';
import 'package:musicapp/ui/screen/account_collection_screen/album_collection.dart';
import 'package:musicapp/ui/screen/account_collection_screen/artist_collection.dart';
import 'package:musicapp/ui/screen/account_collection_screen/my_playlist.dart';
import 'package:musicapp/ui/screen/account_collection_screen/edit_account.dart';
import 'package:musicapp/ui/screen/account_collection_screen/song_collection.dart';
import 'package:musicapp/ui/screen/account_collection_screen/setting.dart';
import 'package:musicapp/ui/widget/component/component.dart';

class Account extends StatefulWidget {
  const Account({Key key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            margin: EdgeInsets.only(top: 66.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Account".tr(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 48.sp),
                  ),
                  IconButton(
                    onPressed: () {
                      RouterClass.routerClass.pushWidget(Setting());
                    },
                    icon: const Icon(Icons.settings),
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 33.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/cover.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(23)),
                      ),
                      Column(
                        children: [
                          Text(
                            "22",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ),
                          Text(
                            "Playlist".tr(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "360 K",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ),
                          Text(
                            "Follower".tr(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "56",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ),
                          Text(
                            "Following".tr(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                  defaultButton(
                    text: "Edit".tr(),
                    width: 78.w,
                    function: () {
                      RouterClass.routerClass.pushWidget(EditAccount());
                    },
                    height: 28,
                    radius: 2,
                  )
                ],
              ),
              SizedBox(
                height: 33.h,
              ),
              Text(
                "Library".tr(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              libraryItem(
                prefixIcon: Icon(
                  Icons.my_library_music_outlined,
                  color: Colors.white,
                ),
                text: "Playlist".tr(),
                function: () {
                  RouterClass.routerClass.pushWidget(MyPlayList());
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
              libraryItem(
                prefixIcon: Icon(
                  Icons.album_outlined,
                  color: Colors.white,
                ),
                text: "albums".tr(),
                function: () {
                  RouterClass.routerClass.pushWidget(AlbumCollection());
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
              libraryItem(
                prefixIcon: Icon(
                  Icons.video_library_outlined,
                  color: Colors.white,
                ),
                text: "songs".tr(),
                function: () {
                  RouterClass.routerClass.pushWidget(SongCollection());
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
              libraryItem(
                prefixIcon: Icon(
                  Icons.contacts_outlined,
                  color: Colors.white,
                ),
                text: "Artist".tr(),
                function: () {
                  RouterClass.routerClass.pushWidget(ArtistCollection());
                },
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
              libraryItem(
                prefixIcon: Icon(
                  Icons.download,
                  color: Colors.white,
                ),
                text: "Download".tr(),
                function: () {},
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
