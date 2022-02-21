import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:musicapp/data/api/api_constants.dart';
import 'package:musicapp/model/aldum_model.dart';

class DioClient {
  DioClient._() {}
  static final DioClient dioClient = DioClient._();

  Future<Album> getAlbumsAPI() async {
    try {
      log('message404');
      Response response = await Dio().get(
        'https://spotify23.p.rapidapi.com/albums/?ids=02FsZxXXYQid3f167p43WF,2acSXrZhyv0h9DK1ycFhvH,50j2xwV87BTH8gc7ioNKW3,6y1pZHwzRrAhLnng4xC1hD,4f7ulBQDUMRrIQF0TeG30t,3ze1DaaeMYtUbnrS0A5O5m,21RHumbIml0kVANVJG06Dt',
        options: Options(headers: {
          'X-RapidAPI-Host': 'spotify23.p.rapidapi.com',
          'X-RapidAPI-Key': 'a7f6e53b75mshcb8d87b2a5013d0p188139jsn01f67df88f9a'
        }),
      );
      // log(response.data.toString());
      Album albumAPI = Album.fromJson(response.data);
      log(albumAPI.albums.length.toString());
      log(albumAPI.albums.length.toString());
      log(albumAPI.albums.length.toString());
      log(albumAPI.albums.length.toString());

      return albumAPI;
    } on Exception catch (e) {
      return null;
    }
  }

  /*Future<Song> getSongsAPI() async {
    try {
      log('message404');
      Response response = await Dio().get(
        'https://spotify23.p.rapidapi.com/tracks/?ids=4WNcduiCmDNfmTEz7JvmLv',
        options: Options(headers: {
          'X-RapidAPI-Host': 'spotify23.p.rapidapi.com',
          'X-RapidAPI-Key': 'a7f6e53b75mshcb8d87b2a5013d0p188139jsn01f67df88f9a'
        }),
      );
      log(response.data.toString());
      Song songsAPI = Song.fromJson(response.data);
      log(songsAPI.tracks.length.toString());
      return songsAPI;
    } on Exception catch (e) {
      return null;
    }
  }*/
  // Future<Song> getSonwwgsAPI() async {
  //   try {
  //     log('message');
  //     Response response = await Dio().get(
  //       'https://spotify23.p.rapidapi.com/tracks/?ids=4WNcduiCmDNfmTEz7JvmLv',
  //       options: Options(headers: {
  //         'X-RapidAPI-Host': 'spotify23.p.rapidapi.com',
  //         'X-RapidAPI-Key': 'a7f6e53b75mshcb8d87b2a5013d0p188139jsn01f67df88f9a'
  //       }),
  //     );
  //     log(response.data.toString());
  //     Song songsAPI = Song.fromJson(response.data);
  //     log(songsAPI.tracks.length.toString());
  //     return songsAPI;
  //   } on Exception catch (e) {
  //     return null;
  //   }
  // }

  // Future<Song> getSongsAPI2() async {
  //   try {
  //     log('message');
  //     Response response = await dio.get(
  //         'https://shazam.p.rapidapi.com/songs/list-artist-top-tracks?id=40008598');
  //     log(response.data.toString());
  //     Song songsAPI = Song.fromJson(response.data);
  //     log(songsAPI.tracks.length.toString());
  //     return songsAPI;
  //   } on Exception catch (e) {
  //     return null;
  //   }
  // }
}
