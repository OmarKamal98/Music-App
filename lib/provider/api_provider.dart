import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:musicapp/data/api/dio_client.dart';
import 'package:musicapp/model/aldum_model.dart';
import 'package:musicapp/model/song_model.dart';

class APIProvider extends ChangeNotifier {
  APIProvider() {
    getTracks();
  }
  List<Albums> albums = [];
  List<Items> items = [];
  getTracks() async {
    Album album = await DioClient.dioClient.getAlbumsAPI();
    albums = album.albums;
    for (int i = 0; i < album.albums.length; i++) {
      items.addAll(album.albums[i].tracks.items);
    }
    items.shuffle();
    log(items.length.toString());
    log(items.length.toString());
    log(items.length.toString());
    notifyListeners();
  }
}
