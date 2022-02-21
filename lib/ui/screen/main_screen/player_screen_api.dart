import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:marquee/marquee.dart';
import 'package:musicapp/model/aldum_model.dart';
import 'package:musicapp/provider/api_provider.dart';
import 'package:musicapp/provider/songs_provider.dart';
import 'package:musicapp/ui/widget/component/seekbar_controlbuttons.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

final _player = AudioPlayer();

// ignore: must_be_immutable
class PlayerScreen1 extends StatefulWidget {
  Items _items;
  int Index;
  PlayerScreen1(this.Index, this._items, {Key key}) : super(key: key);
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen1> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance?.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _init();
  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    // Try to load audio from a source and catch any errors.
    try {
      await _player.stop();
      await _player
          .setAudioSource(AudioSource.uri(Uri.parse(widget._items.previewUrl)));
      await _player.play();
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    List<Items> playingNow = Provider.of<APIProvider>(context).items;
    Color pageColor = Color(0xFF0E0B1F);
    return Scaffold(
      backgroundColor: pageColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.expand_more_rounded),
          tooltip: "back",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          PopupMenuButton(
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
                value: 1,
                child: Row(
                  children: [
                    const Icon(
                      Icons.album_rounded,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      'viewAlbum'.tr(),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(
                      Icons.info_rounded,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      'songInfo'.tr(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width - 35,
              padding: EdgeInsets.only(top: 16.h, left: 20.w, right: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                image: DecorationImage(
                  image: AssetImage('assets/images/cover.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: 27.h),
          Container(
            height: 40.h,
            padding: EdgeInsets.only(left: 39.w, right: 39.w),
            child: buildAnimationText(widget._items.name),
          ),
          SizedBox(height: 7.h),
          Text(
            widget._items.artists.first.name == '<unknown>'
                ? 'unknown'.tr()
                : widget._items.artists.first.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(left: 39.w, right: 39.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.playlist_add,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.volume_up,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showSliderDialog(
                      context: context,
                      title: "volume".tr(),
                      divisions: 10,
                      min: 0.0,
                      max: 1.0,
                      value: _player.volume,
                      stream: _player.volumeStream,
                      onChanged: _player.setVolume,
                    );
                  },
                ),
                StreamBuilder<double>(
                  stream: _player.speedStream,
                  builder: (context, snapshot) => IconButton(
                    icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    onPressed: () {
                      showSliderDialog(
                        context: context,
                        title: "speed".tr(),
                        divisions: 10,
                        min: 0.5,
                        max: 1.5,
                        value: _player.speed,
                        stream: _player.speedStream,
                        onChanged: _player.setSpeed,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          StreamBuilder<PositionData>(
            stream: _positionDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return SeekBar(
                duration: positionData?.duration ?? Duration.zero,
                position: positionData?.position ?? Duration.zero,
                bufferedPosition:
                    positionData?.bufferedPosition ?? Duration.zero,
                onChanged: _player.seek,
              );
            },
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: ControlButtons(
              _player,
              widget.Index,
              listItem: playingNow,
            ),
          ),
          SizedBox(height: 39.h),
        ],
      ),
    );
  }

  Widget buildAnimationText(String text) => Marquee(
        text: text,
        style: TextStyle(
          fontSize: 24.sp,
          color: Colors.white,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
        ),
        blankSpace: 50,
        velocity: -45.0,
      );
}
