// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_audio_query/flutter_audio_query.dart';
// import 'package:just_audio/just_audio.dart';
//
// typedef AudioChangeStatus = void Function(bool);
//
// class AudioManager {
//   static final AudioManager _instance = AudioManager._internal();
//
//   // final OnAudioQuery audioQuery = OnAudioQuery();
//   final audioPlayer = AudioPlayer();
//
//   //Notifiers
//   AudioChangeStatus audioChangeStatus;
//   final audioStatusNotifier = ValueNotifier<AudioStatus>(AudioStatus.paused);
//   bool isDraggingProgressBar = false;
//
//   final currentSongIDNotifier = ValueNotifier<int>(0);
//   final currentSongTitleNotifier = ValueNotifier<String>("Unknown");
//   final currentSongArtistNotifier = ValueNotifier<String>("Unknown");
//   final currentSongArtworkNotifier = ValueNotifier<Uint8List>(null);
//
//   final playlistNotifier = ValueNotifier<List<String>>([]);
//   final isFirstSongNotifier = ValueNotifier<bool>(true);
//   final isLastSongNotifier = ValueNotifier<bool>(true);
//   final isShuffleModeEnabledNotifier = ValueNotifier<bool>(false);
//   final loopModeNotifier = ValueNotifier<LoopModeState>(LoopModeState.loopAll);
//
//   factory AudioManager() {
//     return _instance;
//   }
//
//   AudioManager._internal() {
//     audioChangeStatus = (bool tmp) {};
//     _initAudioPlayer();
//   }
//
//   void _initAudioPlayer() {
//     _initPlayerStateStream();
//
//     _initSequenceStateStream();
//   }
//
//   Future<void> seek(Duration duration) async {
//     await audioPlayer.seek(duration);
//   }
//
//   void pauseAudio() {
//     try {
//       audioPlayer.pause();
//       // ignore: empty_catches
//     } on Exception {}
//   }
//
//   void playAudio() {
//     try {
//       audioPlayer.play();
//       // ignore: empty_catches
//     } on Exception {}
//   }
//
//   void seekToPreviousAudio() {
//     audioPlayer.seekToPrevious();
//   }
//
//   void seekToNextAudio() {
//     audioPlayer.seekToNext();
//   }
//
//   void setLoopModeToLoopAll() {
//     loopModeNotifier.value = LoopModeState.loopAll;
//     audioPlayer.setShuffleModeEnabled(false);
//     audioPlayer.setLoopMode(LoopMode.all);
//   }
//
//   void setLoopModeToLoopOne() {
//     loopModeNotifier.value = LoopModeState.loopOne;
//     audioPlayer.setLoopMode(LoopMode.one);
//   }
//
//   void setLoopModeToShuffle() {
//     loopModeNotifier.value = LoopModeState.shuffle;
//     audioPlayer.setShuffleModeEnabled(true);
//     audioPlayer.setLoopMode(LoopMode.all);
//   }
//
//   void _initPlayerStateStream() {
//     audioPlayer.playerStateStream.listen((playerState) {
//       final isPlaying = playerState.playing;
//       final processingState = playerState.processingState;
//       if (processingState == ProcessingState.loading ||
//           processingState == ProcessingState.buffering) {
//         // buttonNotifier.value = ButtonState.loading;
//       } else if (!isPlaying) {
//         audioStatusNotifier.value = AudioStatus.paused;
//         audioChangeStatus(false);
//       } else if (processingState != ProcessingState.completed) {
//         audioStatusNotifier.value = AudioStatus.playing;
//         audioChangeStatus(true);
//       } else {
//         audioPlayer.seek(Duration.zero);
//         pauseAudio();
//       }
//     });
//   }
//
//   void _initSequenceStateStream() {
//     audioPlayer.sequenceStateStream.listen((sequenceState) {
//       if (sequenceState == null) return;
//       final currentItem = sequenceState.currentSource;
//       final tag = currentItem?.tag as SongInfo;
//       if (tag != null) {
//         currentSongTitleNotifier.value = tag.title;
//         currentSongArtistNotifier.value = tag.artist;
//       }
//       isShuffleModeEnabledNotifier.value = sequenceState.shuffleModeEnabled;
//       final playlist = sequenceState.effectiveSequence;
//       if (playlist.isEmpty || currentItem == null) {
//         isFirstSongNotifier.value = true;
//         isLastSongNotifier.value = true;
//       } else {
//         isFirstSongNotifier.value = playlist.first == currentItem;
//         isLastSongNotifier.value = playlist.last == currentItem;
//       }
//     });
//   }
// }
//
// class ProgressBarStatus {
//   final Duration current;
//   final Duration buffered;
//   final Duration total;
//
//   ProgressBarStatus({this.current, this.buffered, this.total});
// }
//
// enum AudioStatus {
//   playing,
//   paused,
//   // loading
// }
//
// enum LoopModeState {
//   loopOne,
//   loopAll,
//   shuffle,
// }
