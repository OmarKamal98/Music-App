// // class SongPlayList{
// //   int id;
// //   String title;
// //   bool isComplete;
// //   SongPlayList({this.id, this.title, this.isComplete = false});
// //   SongPlayList.fromMap(Map map) {
// //     this.id = map['id'];
// //     this.title = map['title'];
// //     this.isComplete = map['isComplete'] == 1 ? true : false;
// //   }
// //   toMap() {
// //     return {'title': this.title, 'isComplete': this.isComplete ? 1 : 0};
// //   }
// // }
//
// import 'package:musicapp/model/aldum_model.dart';
//
// class Items {
//   List<Artists> artists;
//   int discNumber;
//   int durationMs;
//   bool explicit;
//   ExternalUrls externalUrls;
//   String id;
//   bool isLocal;
//   bool isPlayable;
//   String name;
//   String previewUrl;
//   int trackNumber;
//   String type;
//   String uri;
//
//   Items(
//       {this.artists,
//         this.discNumber,
//         this.durationMs,
//         this.explicit,
//         this.externalUrls,
//         this.id,
//         this.isLocal,
//         this.isPlayable,
//         this.name,
//         this.previewUrl,
//         this.trackNumber,
//         this.type,
//         this.uri});
//
//   Items.fromJson(Map<String, dynamic> json) {
//     if (json['artists'] != null) {
//       artists = <Artists>[];
//       json['artists'].forEach((v) {
//         artists.add(new Artists.fromJson(v));
//       });
//     }
//     discNumber = json['disc_number'];
//     durationMs = json['duration_ms'];
//     explicit = json['explicit'];
//     externalUrls = json['external_urls'] != null
//         ? new ExternalUrls.fromJson(json['external_urls'])
//         : null;
//     id = json['id'];
//     isLocal = json['is_local'];
//     isPlayable = json['is_playable'];
//     name = json['name'];
//     previewUrl = json['preview_url'];
//     trackNumber = json['track_number'];
//     type = json['type'];
//     uri = json['uri'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.artists != null) {
//       data['artists'] = this.artists.map((v) => v.toJson()).toList();
//     }
//     data['disc_number'] = this.discNumber;
//     data['duration_ms'] = this.durationMs;
//     data['explicit'] = this.explicit;
//     if (this.externalUrls != null) {
//       data['external_urls'] = this.externalUrls.toJson();
//     }
//     data['id'] = this.id;
//     data['is_local'] = this.isLocal;
//     data['is_playable'] = this.isPlayable;
//     data['name'] = this.name;
//     data['preview_url'] = this.previewUrl;
//     data['track_number'] = this.trackNumber;
//     data['type'] = this.type;
//     data['uri'] = this.uri;
//     return data;
//   }
// }
