import 'dart:developer';
import 'package:blur/blur.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:musicapp/model/aldum_model.dart';
import 'package:musicapp/navigator/router_class.dart';
import 'package:musicapp/provider/api_provider.dart';
import 'package:musicapp/ui/screen/main_screen/player_screen_api.dart';
import 'package:musicapp/ui/widget/component/component.dart';
import 'package:provider/provider.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  bool isVisible = true;
  TextEditingController searchController = TextEditingController();
  ScrollController rrectController = ScrollController();
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
            Container(
              height: 190,
              padding: EdgeInsets.only(top: 17.h),
              child: Consumer<APIProvider>(builder: (context, provider, x) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.albums.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 150,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 12, left: 12),
                                  child: Image.network(provider
                                          .albums[index].images.first.url
                                          .toString())
                                      .blurred(
                                    colorOpacity: 0.2,
                                    borderRadius: BorderRadius.circular(25),
                                    blur: 20,
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 12, right: 12),
                                    child: Image.network(provider
                                            .albums[index].images.first.url
                                            .toString())
                                        .blurred(
                                      borderRadius: BorderRadius.circular(27),
                                      blur: 0,
                                      colorOpacity: 0.0,
                                    )),
                              ],
                            ),
                            Container(
                              child: Text(
                                provider.albums[index].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Visibility(
                    visible: isVisible,
                    child: Text(
                      "PopularMusic".tr(),
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Container(
                      child: AnimSearchBar(
                        closeSearchOnSuffixTap: true,
                        width: 200,
                        textController: searchController,
                        onSuffixTap: () {
                          setState(() {
                            searchController.clear();
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
            ),
            Container(
              height: 300,
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
                            child: Scrollbar(
                              isAlwaysShown: true,
                              showTrackOnHover: true,
                              hoverThickness: 30.0,
                              controller: rrectController,
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsets.only(bottom: 10),
                                shrinkWrap: true,
                                itemExtent: 70.0,
                                controller: rrectController,
                                itemCount: provider.items.length,
                                itemBuilder: (context, index) {
                                  Items songItem = provider.items[index];
                                  return Card(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: ListTile(
                                      leading: InkWell(
                                        onTap: () {
                                          RouterClass.routerClass.pushWidget(
                                              PlayerScreen1(index, songItem));
                                        },
                                        child: Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/cover.jpg'),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                      title: InkWell(
                                        onTap: () {
                                          RouterClass.routerClass.pushWidget(
                                              PlayerScreen1(index, songItem));
                                        },
                                        child: Text(songItem.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white)
                                            // overflow: TextOverflow.ellipsis,
                                            ),
                                      ),
                                      subtitle: InkWell(
                                        onTap: () {
                                          RouterClass.routerClass.pushWidget(
                                              PlayerScreen1(index, songItem));
                                        },
                                        child: Text(songItem.artists.first.name,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white)),
                                      ),
                                      trailing: PopupMenuButton(
                                        icon: const Icon(
                                          Icons.more_vert_rounded,
                                          color: Colors.white,
                                        ),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15.0),
                                          ),
                                        ),
                                        onSelected: (int value) {},
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            value: 0,
                                            child: InkWell(
                                              onTap: () {
                                                log('showed dialog');
                                                playListInputDialog(context);
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.playlist_add,
                                                    color: Theme.of(context)
                                                        .iconTheme
                                                        .color,
                                                  ),
                                                  const SizedBox(width: 10.0),
                                                  Text(
                                                    'addToPlaylist',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          PopupMenuItem(
                                            value: 2,
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.album_rounded,
                                                ),
                                                const SizedBox(width: 10.0),
                                                Text(
                                                  'viewAlbum',
                                                ),
                                              ],
                                            ),
                                          ),
                                          PopupMenuItem(
                                            value: 3,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.info_rounded,
                                                  color: Theme.of(context)
                                                      .iconTheme
                                                      .color,
                                                ),
                                                const SizedBox(width: 10.0),
                                                Text(
                                                  'songInfo',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
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
