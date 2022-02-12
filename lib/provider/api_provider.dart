import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/data/api/dio_client.dart';
import 'package:musicapp/model/aldum_model.dart';

class APIProvider extends ChangeNotifier {
  APIProvider() {
    // getAllAlbum();
  }

  List<Albums> albums = [];

  // getAllAlbum() async {
  //   Album album = (await DioClient.dioClient.getAlbum());
  //   log('omar okefpojeinkjnef omar omar oamr');
  //   this.albums.addAll(album.albums);
  //   notifyListeners();
  //   return albums;
  // }
  // getAllSong() async {
  //   Song song =  await DioClient.dioClient.getSong())  ;
  //   this.albums.addAll(album.albums);
  //   notifyListeners();
  // }
}
