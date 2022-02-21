// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:musicapp/helper/audio_player_helper.dart';
//
// class MiniPlayer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<Uint8List>(
//       valueListenable: AudioManager().currentSongArtworkNotifier,
//       builder: (_, value, __) {
//         return Stack(children: [
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/cover.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: Align(
//               alignment: Alignment.topCenter,
//               child: Container(
//                   height: 4,
//                   width: 40,
//                   decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.8),
//                       borderRadius: BorderRadius.circular(100),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(1),
//                           blurRadius: 8,
//                         ),
//                       ])),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 30),
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: FittedBox(
//                 fit: BoxFit.scaleDown,
//                 alignment: Alignment.center,
//                 child: Container(
//                   width: 100,
//                   height: 120,
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         ValueListenableBuilder<String>(
//                           valueListenable:
//                               AudioManager().currentSongTitleNotifier,
//                           builder: (_, value, __) {
//                             return Text(
//                               value,
//                               textAlign: TextAlign.center,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             );
//                           },
//                         ),
//                         ValueListenableBuilder<String>(
//                           valueListenable:
//                               AudioManager().currentSongArtistNotifier,
//                           builder: (_, value, __) {
//                             return Text(
//                               value,
//                               textAlign: TextAlign.center,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             );
//                           },
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: const [],
//                         ),
//                       ]),
//                 ),
//               ),
//             ),
//           )
//         ]);
//       },
//     );
//   }
// }
