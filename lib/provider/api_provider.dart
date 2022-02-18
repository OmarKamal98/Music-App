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
    items = album.albums.first.tracks.items;
    notifyListeners();
  }
}
