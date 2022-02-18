// class Song {
//   String id;
//   String type;
//   String layout;
//   String title;
//   String url;
//   String appleMusicUrl;
//   String subtitle;
//   Images images;
//   Share share;
//   Hub hub;
//   Null artists;
//
//   Song(
//       {this.id,
//       this.type,
//       this.layout,
//       this.title,
//       this.url,
//       this.appleMusicUrl,
//       this.subtitle,
//       this.images,
//       this.share,
//       this.hub,
//       this.artists});
//
//   Song.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     type = json['type'];
//     layout = json['layout'];
//     title = json['title'];
//     url = json['url'];
//     appleMusicUrl = json['apple_music_url'];
//     subtitle = json['subtitle'];
//     images =
//         json['images'] != null ? new Images.fromJson(json['images']) : null;
//     share = json['share'] != null ? new Share.fromJson(json['share']) : null;
//     hub = json['hub'] != null ? new Hub.fromJson(json['hub']) : null;
//     artists = json['artists'];
//   }
//   Song.fromMap(Map map) {
//     this.id = map['id'];
//     this.type = map['type'];
//     this.layout = map['layout'];
//     this.title = map['title'];
//     this.url = map['url'];
//     this.appleMusicUrl = map['apple_music_url'];
//     this.subtitle = map['subtitle'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['type'] = this.type;
//     data['layout'] = this.layout;
//     data['title'] = this.title;
//     data['url'] = this.url;
//     data['apple_music_url'] = this.appleMusicUrl;
//     data['subtitle'] = this.subtitle;
//     if (this.images != null) {
//       data['images'] = this.images.toJson();
//     }
//     if (this.share != null) {
//       data['share'] = this.share.toJson();
//     }
//     if (this.hub != null) {
//       data['hub'] = this.hub.toJson();
//     }
//     data['artists'] = this.artists;
//     return data;
//   }
// }
//
// class Images {
//   String background;
//   String coverart;
//   String coverarthq;
//   String joecolor;
//
//   Images({this.background, this.coverart, this.coverarthq, this.joecolor});
//
//   Images.fromJson(Map<String, dynamic> json) {
//     background = json['background'];
//     coverart = json['coverart'];
//     coverarthq = json['coverarthq'];
//     joecolor = json['joecolor'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['background'] = this.background;
//     data['coverart'] = this.coverart;
//     data['coverarthq'] = this.coverarthq;
//     data['joecolor'] = this.joecolor;
//     return data;
//   }
// }
//
// class Share {
//   String subject;
//   String text;
//   String href;
//   String image;
//   String twitter;
//   String html;
//   String snapchat;
//
//   Share(
//       {this.subject,
//       this.text,
//       this.href,
//       this.image,
//       this.twitter,
//       this.html,
//       this.snapchat});
//
//   Share.fromJson(Map<String, dynamic> json) {
//     subject = json['subject'];
//     text = json['text'];
//     href = json['href'];
//     image = json['image'];
//     twitter = json['twitter'];
//     html = json['html'];
//     snapchat = json['snapchat'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['subject'] = this.subject;
//     data['text'] = this.text;
//     data['href'] = this.href;
//     data['image'] = this.image;
//     data['twitter'] = this.twitter;
//     data['html'] = this.html;
//     data['snapchat'] = this.snapchat;
//     return data;
//   }
// }
//
// class Hub {
//   String type;
//   String image;
//   List<Actions> actions;
//   List<Options> options;
//   bool explicit;
//   String displayname;
//
//   Hub(
//       {this.type,
//       this.image,
//       this.actions,
//       this.options,
//       this.explicit,
//       this.displayname});
//
//   Hub.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     image = json['image'];
//     if (json['actions'] != null) {
//       actions = <Actions>[];
//       json['actions'].forEach((v) {
//         actions.add(new Actions.fromJson(v));
//       });
//     }
//     if (json['options'] != null) {
//       options = <Options>[];
//       json['options'].forEach((v) {
//         options.add(new Options.fromJson(v));
//       });
//     }
//     explicit = json['explicit'];
//     displayname = json['displayname'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     data['image'] = this.image;
//     if (this.actions != null) {
//       data['actions'] = this.actions.map((v) => v.toJson()).toList();
//     }
//     if (this.options != null) {
//       data['options'] = this.options.map((v) => v.toJson()).toList();
//     }
//     data['explicit'] = this.explicit;
//     data['displayname'] = this.displayname;
//     return data;
//   }
// }
//
// class Actions {
//   String name;
//   String type;
//   String id;
//   String uri;
//
//   Actions({this.name, this.type, this.id, this.uri});
//
//   Actions.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     type = json['type'];
//     id = json['id'];
//     uri = json['uri'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['type'] = this.type;
//     data['id'] = this.id;
//     data['uri'] = this.uri;
//     return data;
//   }
// }
//
// class Options {
//   String caption;
//   List<Actions> actions;
//   Beacondata beacondata;
//   String image;
//   String type;
//   String listcaption;
//   String overflowimage;
//   bool colouroverflowimage;
//   String providername;
//
//   Options(
//       {this.caption,
//       this.actions,
//       this.beacondata,
//       this.image,
//       this.type,
//       this.listcaption,
//       this.overflowimage,
//       this.colouroverflowimage,
//       this.providername});
//
//   Options.fromJson(Map<String, dynamic> json) {
//     caption = json['caption'];
//     if (json['actions'] != null) {
//       actions = <Actions>[];
//       json['actions'].forEach((v) {
//         actions.add(new Actions.fromJson(v));
//       });
//     }
//     beacondata = json['beacondata'] != null
//         ? new Beacondata.fromJson(json['beacondata'])
//         : null;
//     image = json['image'];
//     type = json['type'];
//     listcaption = json['listcaption'];
//     overflowimage = json['overflowimage'];
//     colouroverflowimage = json['colouroverflowimage'];
//     providername = json['providername'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['caption'] = this.caption;
//     if (this.actions != null) {
//       data['actions'] = this.actions.map((v) => v.toJson()).toList();
//     }
//     if (this.beacondata != null) {
//       data['beacondata'] = this.beacondata.toJson();
//     }
//     data['image'] = this.image;
//     data['type'] = this.type;
//     data['listcaption'] = this.listcaption;
//     data['overflowimage'] = this.overflowimage;
//     data['colouroverflowimage'] = this.colouroverflowimage;
//     data['providername'] = this.providername;
//     return data;
//   }
// }
//
// // class Actions {
// //   String name;
// //   String type;
// //   String uri;
// //
// //   Actions({this.name, this.type, this.uri});
// //
// //   Actions.fromJson(Map<String, dynamic> json) {
// //     name = json['name'];
// //     type = json['type'];
// //     uri = json['uri'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['name'] = this.name;
// //     data['type'] = this.type;
// //     data['uri'] = this.uri;
// //     return data;
// //   }
// // }
//
// class Beacondata {
//   String type;
//   String providername;
//
//   Beacondata({this.type, this.providername});
//
//   Beacondata.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     providername = json['providername'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     data['providername'] = this.providername;
//     return data;
//   }
// }
// //  class Song {
// //   List<Tracks> tracks;
// //
// //   Song({this.tracks});
// //
// //   Song.fromJson(Map<String, dynamic> json) {
// //     if (json['tracks'] != null) {
// //       tracks = <Tracks>[];
// //       json['tracks'].forEach((v) {
// //         tracks.add(new Tracks.fromJson(v));
// //       });
// //     }
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     if (this.tracks != null) {
// //       data['tracks'] = this.tracks.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }
// //
// // class Tracks {
// //   String layout;
// //   String type;
// //   String key;
// //   String title;
// //   String subtitle;
// //   Share share;
// //   Images images;
// //   Hub hub;
// //   List<Artists> artists;
// //   String url;
// //
// //   Tracks(
// //       {this.layout,
// //       this.type,
// //       this.key,
// //       this.title,
// //       this.subtitle,
// //       this.share,
// //       this.images,
// //       this.hub,
// //       this.artists,
// //       this.url});
// //
// //   Tracks.fromJson(Map<String, dynamic> json) {
// //     layout = json['layout'];
// //     type = json['type'];
// //     key = json['key'];
// //     title = json['title'];
// //     subtitle = json['subtitle'];
// //     share = json['share'] != null ? new Share.fromJson(json['share']) : null;
// //     images =
// //         json['images'] != null ? new Images.fromJson(json['images']) : null;
// //     hub = json['hub'] != null ? new Hub.fromJson(json['hub']) : null;
// //     if (json['artists'] != null) {
// //       artists = <Artists>[];
// //       json['artists'].forEach((v) {
// //         artists.add(new Artists.fromJson(v));
// //       });
// //     }
// //     url = json['url'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['layout'] = this.layout;
// //     data['type'] = this.type;
// //     data['key'] = this.key;
// //     data['title'] = this.title;
// //     data['subtitle'] = this.subtitle;
// //     if (this.share != null) {
// //       data['share'] = this.share.toJson();
// //     }
// //     if (this.images != null) {
// //       data['images'] = this.images.toJson();
// //     }
// //     if (this.hub != null) {
// //       data['hub'] = this.hub.toJson();
// //     }
// //     if (this.artists != null) {
// //       data['artists'] = this.artists.map((v) => v.toJson()).toList();
// //     }
// //     data['url'] = this.url;
// //     return data;
// //   }
// // }
// //
// // class Share {
// //   String subject;
// //   String text;
// //   String href;
// //   String image;
// //   String twitter;
// //   String html;
// //   String avatar;
// //   String snapchat;
// //
// //   Share(
// //       {this.subject,
// //       this.text,
// //       this.href,
// //       this.image,
// //       this.twitter,
// //       this.html,
// //       this.avatar,
// //       this.snapchat});
// //
// //   Share.fromJson(Map<String, dynamic> json) {
// //     subject = json['subject'];
// //     text = json['text'];
// //     href = json['href'];
// //     image = json['image'];
// //     twitter = json['twitter'];
// //     html = json['html'];
// //     avatar = json['avatar'];
// //     snapchat = json['snapchat'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['subject'] = this.subject;
// //     data['text'] = this.text;
// //     data['href'] = this.href;
// //     data['image'] = this.image;
// //     data['twitter'] = this.twitter;
// //     data['html'] = this.html;
// //     data['avatar'] = this.avatar;
// //     data['snapchat'] = this.snapchat;
// //     return data;
// //   }
// // }
// //
// // class Images {
// //   String background;
// //   String coverart;
// //   String coverarthq;
// //   String joecolor;
// //
// //   Images({this.background, this.coverart, this.coverarthq, this.joecolor});
// //
// //   Images.fromJson(Map<String, dynamic> json) {
// //     background = json['background'];
// //     coverart = json['coverart'];
// //     coverarthq = json['coverarthq'];
// //     joecolor = json['joecolor'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['background'] = this.background;
// //     data['coverart'] = this.coverart;
// //     data['coverarthq'] = this.coverarthq;
// //     data['joecolor'] = this.joecolor;
// //     return data;
// //   }
// // }
// //
// // class Hub {
// //   String type;
// //   String image;
// //   List<Actions> actions;
// //   List<Options> options;
// //   List<Providers> providers;
// //   bool explicit;
// //   String displayname;
// //
// //   Hub(
// //       {this.type,
// //       this.image,
// //       this.actions,
// //       this.options,
// //       this.providers,
// //       this.explicit,
// //       this.displayname});
// //
// //   Hub.fromJson(Map<String, dynamic> json) {
// //     type = json['type'];
// //     image = json['image'];
// //     if (json['actions'] != null) {
// //       actions = <Actions>[];
// //       json['actions'].forEach((v) {
// //         actions.add(new Actions.fromJson(v));
// //       });
// //     }
// //     if (json['options'] != null) {
// //       options = <Options>[];
// //       json['options'].forEach((v) {
// //         options.add(new Options.fromJson(v));
// //       });
// //     }
// //     if (json['providers'] != null) {
// //       providers = <Providers>[];
// //       json['providers'].forEach((v) {
// //         providers.add(new Providers.fromJson(v));
// //       });
// //     }
// //     explicit = json['explicit'];
// //     displayname = json['displayname'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['type'] = this.type;
// //     data['image'] = this.image;
// //     if (this.actions != null) {
// //       data['actions'] = this.actions.map((v) => v.toJson()).toList();
// //     }
// //     if (this.options != null) {
// //       data['options'] = this.options.map((v) => v.toJson()).toList();
// //     }
// //     if (this.providers != null) {
// //       data['providers'] = this.providers.map((v) => v.toJson()).toList();
// //     }
// //     data['explicit'] = this.explicit;
// //     data['displayname'] = this.displayname;
// //     return data;
// //   }
// // }
// //
// // class Actions {
// //   String name;
// //   String type;
// //   String id;
// //   String uri;
// //
// //   Actions({this.name, this.type, this.id, this.uri});
// //
// //   Actions.fromJson(Map<String, dynamic> json) {
// //     name = json['name'];
// //     type = json['type'];
// //     id = json['id'];
// //     uri = json['uri'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['name'] = this.name;
// //     data['type'] = this.type;
// //     data['id'] = this.id;
// //     data['uri'] = this.uri;
// //     return data;
// //   }
// // }
// //
// // class Options {
// //   String caption;
// //   List<Actions> actions;
// //   Beacondata beacondata;
// //   String image;
// //   String type;
// //   String listcaption;
// //   String overflowimage;
// //   bool colouroverflowimage;
// //   String providername;
// //
// //   Options(
// //       {this.caption,
// //       this.actions,
// //       this.beacondata,
// //       this.image,
// //       this.type,
// //       this.listcaption,
// //       this.overflowimage,
// //       this.colouroverflowimage,
// //       this.providername});
// //
// //   Options.fromJson(Map<String, dynamic> json) {
// //     caption = json['caption'];
// //     if (json['actions'] != null) {
// //       actions = <Actions>[];
// //       json['actions'].forEach((v) {
// //         actions.add(new Actions.fromJson(v));
// //       });
// //     }
// //     beacondata = json['beacondata'] != null
// //         ? new Beacondata.fromJson(json['beacondata'])
// //         : null;
// //     image = json['image'];
// //     type = json['type'];
// //     listcaption = json['listcaption'];
// //     overflowimage = json['overflowimage'];
// //     colouroverflowimage = json['colouroverflowimage'];
// //     providername = json['providername'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['caption'] = this.caption;
// //     if (this.actions != null) {
// //       data['actions'] = this.actions.map((v) => v.toJson()).toList();
// //     }
// //     if (this.beacondata != null) {
// //       data['beacondata'] = this.beacondata.toJson();
// //     }
// //     data['image'] = this.image;
// //     data['type'] = this.type;
// //     data['listcaption'] = this.listcaption;
// //     data['overflowimage'] = this.overflowimage;
// //     data['colouroverflowimage'] = this.colouroverflowimage;
// //     data['providername'] = this.providername;
// //     return data;
// //   }
// // }
// // //
// // // class Actions {
// // //   String name;
// // //   String type;
// // //   String uri;
// // //
// // //   Actions({this.name, this.type, this.uri});
// // //
// // //   Actions.fromJson(Map<String, dynamic> json) {
// // //     name = json['name'];
// // //     type = json['type'];
// // //     uri = json['uri'];
// // //   }
// // //
// // //   Map<String, dynamic> toJson() {
// // //     final Map<String, dynamic> data = new Map<String, dynamic>();
// // //     data['name'] = this.name;
// // //     data['type'] = this.type;
// // //     data['uri'] = this.uri;
// // //     return data;
// // //   }
// // // }
// //
// // class Beacondata {
// //   String type;
// //   String providername;
// //
// //   Beacondata({this.type, this.providername});
// //
// //   Beacondata.fromJson(Map<String, dynamic> json) {
// //     type = json['type'];
// //     providername = json['providername'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['type'] = this.type;
// //     data['providername'] = this.providername;
// //     return data;
// //   }
// // }
// //
// // class Providers {
// //   String caption;
// //   Images images;
// //   List<Actions> actions;
// //   String type;
// //
// //   Providers({this.caption, this.images, this.actions, this.type});
// //
// //   Providers.fromJson(Map<String, dynamic> json) {
// //     caption = json['caption'];
// //     images =
// //         json['images'] != null ? new Images.fromJson(json['images']) : null;
// //     if (json['actions'] != null) {
// //       actions = <Actions>[];
// //       json['actions'].forEach((v) {
// //         actions.add(new Actions.fromJson(v));
// //       });
// //     }
// //     type = json['type'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['caption'] = this.caption;
// //     if (this.images != null) {
// //       data['images'] = this.images.toJson();
// //     }
// //     if (this.actions != null) {
// //       data['actions'] = this.actions.map((v) => v.toJson()).toList();
// //     }
// //     data['type'] = this.type;
// //     return data;
// //   }
// // }
// // //
// // // class Images {
// // //   String overflow;
// // //   String default1;
// // //
// // //   Images({this.overflow, this.default1});
// // //
// // // Images.fromJson(Map<String, dynamic> json) {
// // // overflow = json['overflow'];
// // // default1 = json['default'];
// // // }
// // //
// // // Map<String, dynamic> toJson() {
// // //   final Map<String, dynamic> data = new Map<String, dynamic>();
// // //   data['overflow'] = this.overflow;
// // //   data['default'] = this.default;
// // //   return data;
// // // }
// // // }
// //
// // class Artists {
// //   String id;
// //   String adamid;
// //
// //   Artists({this.id, this.adamid});
// //
// //   Artists.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     adamid = json['adamid'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['adamid'] = this.adamid;
// //     return data;
// //   }
// // }
// // /*
// // class Song {
// //   List<Tracks> tracks;
// //
// //   Song({this.tracks});
// //
// //   Song.fromJson(Map<String, dynamic> json) {
// //     if (json['tracks'] != null) {
// //       tracks = <Tracks>[];
// //       json['tracks'].forEach((v) {
// //         tracks.add(new Tracks.fromJson(v));
// //       });
// //     }
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     if (this.tracks = null) {
// //       data['tracks'] = this.tracks.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }
// //
// // class Tracks {
// //   Album album;
// //   List<Artists> artists;
// //   int discNumber;
// //   int durationMs;
// //   bool explicit;
// //   ExternalIds externalIds;
// //   ExternalUrls externalUrls;
// //   String id;
// //   bool isLocal;
// //   bool isPlayable;
// //   String name;
// //   int popularity;
// //   String previewUrl;
// //   int trackNumber;
// //   String type;
// //   String uri;
// //
// //   Tracks(
// //       {this.album,
// //       this.artists,
// //       this.discNumber,
// //       this.durationMs,
// //       this.explicit,
// //       this.externalIds,
// //       this.externalUrls,
// //       this.id,
// //       this.isLocal,
// //       this.isPlayable,
// //       this.name,
// //       this.popularity,
// //       this.previewUrl,
// //       this.trackNumber,
// //       this.type,
// //       this.uri});
// //
// //   Tracks.fromJson(Map<String, dynamic> json) {
// //     album = json['album'] != null ? new Album.fromJson(json['album']) : null;
// //     if (json['artists'] != null) {
// //       artists = <Artists>[];
// //       json['artists'].forEach((v) {
// //         artists.add(new Artists.fromJson(v));
// //       });
// //     }
// //     discNumber = json['disc_number'];
// //     durationMs = json['duration_ms'];
// //     explicit = json['explicit'];
// //     externalIds = json['external_ids'] != null
// //         ? new ExternalIds.fromJson(json['external_ids'])
// //         : null;
// //     externalUrls = json['external_urls'] != null
// //         ? new ExternalUrls.fromJson(json['external_urls'])
// //         : null;
// //     id = json['id'];
// //     isLocal = json['is_local'];
// //     isPlayable = json['is_playable'];
// //     name = json['name'];
// //     popularity = json['popularity'];
// //     previewUrl = json['preview_url'];
// //     trackNumber = json['track_number'];
// //     type = json['type'];
// //     uri = json['uri'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     if (this.album = null) {
// //       data['album'] = this.album.toJson();
// //     }
// //     if (this.artists = null) {
// //       data['artists'] = this.artists.map((v) => v.toJson()).toList();
// //     }
// //     data['disc_number'] = this.discNumber;
// //     data['duration_ms'] = this.durationMs;
// //     data['explicit'] = this.explicit;
// //     if (this.externalIds = null) {
// //       data['external_ids'] = this.externalIds.toJson();
// //     }
// //     if (this.externalUrls = null) {
// //       data['external_urls'] = this.externalUrls.toJson();
// //     }
// //     data['id'] = this.id;
// //     data['is_local'] = this.isLocal;
// //     data['is_playable'] = this.isPlayable;
// //     data['name'] = this.name;
// //     data['popularity'] = this.popularity;
// //     data['preview_url'] = this.previewUrl;
// //     data['track_number'] = this.trackNumber;
// //     data['type'] = this.type;
// //     data['uri'] = this.uri;
// //     return data;
// //   }
// // }
// //
// // class Album {
// //   String albumType;
// //   List<Artists> artists;
// //   ExternalUrls externalUrls;
// //   String id;
// //   List<Images> images;
// //   String name;
// //   String releaseDate;
// //   String releaseDatePrecision;
// //   int totalTracks;
// //   String type;
// //   String uri;
// //
// //   Album(
// //       {this.albumType,
// //       this.artists,
// //       this.externalUrls,
// //       this.id,
// //       this.images,
// //       this.name,
// //       this.releaseDate,
// //       this.releaseDatePrecision,
// //       this.totalTracks,
// //       this.type,
// //       this.uri});
// //
// //   Album.fromJson(Map<String, dynamic> json) {
// //     albumType = json['album_type'];
// //     if (json['artists'] != null) {
// //       artists = <Artists>[];
// //       json['artists'].forEach((v) {
// //         artists.add(new Artists.fromJson(v));
// //       });
// //     }
// //     externalUrls = json['external_urls'] != null
// //         ? new ExternalUrls.fromJson(json['external_urls'])
// //         : null;
// //     id = json['id'];
// //     if (json['images'] != null) {
// //       images = <Images>[];
// //       json['images'].forEach((v) {
// //         images.add(new Images.fromJson(v));
// //       });
// //     }
// //     name = json['name'];
// //     releaseDate = json['release_date'];
// //     releaseDatePrecision = json['release_date_precision'];
// //     totalTracks = json['total_tracks'];
// //     type = json['type'];
// //     uri = json['uri'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['album_type'] = this.albumType;
// //     if (this.artists = null) {
// //       data['artists'] = this.artists.map((v) => v.toJson()).toList();
// //     }
// //     if (this.externalUrls = null) {
// //       data['external_urls'] = this.externalUrls.toJson();
// //     }
// //     data['id'] = this.id;
// //     if (this.images = null) {
// //       data['images'] = this.images.map((v) => v.toJson()).toList();
// //     }
// //     data['name'] = this.name;
// //     data['release_date'] = this.releaseDate;
// //     data['release_date_precision'] = this.releaseDatePrecision;
// //     data['total_tracks'] = this.totalTracks;
// //     data['type'] = this.type;
// //     data['uri'] = this.uri;
// //     return data;
// //   }
// // }
// //
// // class Artists {
// //   ExternalUrls externalUrls;
// //   String id;
// //   String name;
// //   String type;
// //   String uri;
// //
// //   Artists({this.externalUrls, this.id, this.name, this.type, this.uri});
// //
// //   Artists.fromJson(Map<String, dynamic> json) {
// //     externalUrls = json['external_urls'] != null
// //         ? new ExternalUrls.fromJson(json['external_urls'])
// //         : null;
// //     id = json['id'];
// //     name = json['name'];
// //     type = json['type'];
// //     uri = json['uri'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     if (this.externalUrls = null) {
// //       data['external_urls'] = this.externalUrls.toJson();
// //     }
// //     data['id'] = this.id;
// //     data['name'] = this.name;
// //     data['type'] = this.type;
// //     data['uri'] = this.uri;
// //     return data;
// //   }
// // }
// //
// // class ExternalUrls {
// //   String spotify;
// //
// //   ExternalUrls({this.spotify});
// //
// //   ExternalUrls.fromJson(Map<String, dynamic> json) {
// //     spotify = json['spotify'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['spotify'] = this.spotify;
// //     return data;
// //   }
// // }
// //
// // class Images {
// //   int height;
// //   String url;
// //   int width;
// //
// //   Images({this.height, this.url, this.width});
// //
// //   Images.fromJson(Map<String, dynamic> json) {
// //     height = json['height'];
// //     url = json['url'];
// //     width = json['width'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['height'] = this.height;
// //     data['url'] = this.url;
// //     data['width'] = this.width;
// //     return data;
// //   }
// // }
// //
// // class ExternalIds {
// //   String isrc;
// //
// //   ExternalIds({this.isrc});
// //
// //   ExternalIds.fromJson(Map<String, dynamic> json) {
// //     isrc = json['isrc'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['isrc'] = this.isrc;
// //     return data;
// //   }
// // }
// // */
