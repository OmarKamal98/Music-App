import 'package:flutter/material.dart';
import 'package:musicapp/provider/api_provider.dart';
import 'package:provider/provider.dart';

class AlbumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Album Screen'),
        ),
        body: Consumer<APIProvider>(builder: (context, provider, x) {
          return provider.albums.length == 0
              ? Center(
                  child: Text(
                    'no Album found ',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, position) {
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text(provider.albums[position].name),
                                backgroundColor: Colors.transparent,
                                radius: 50,
                              ),
                              title: Text(provider.albums[position].name),
                              subtitle: Text(provider
                                  .albums[position].artists.first
                                  .toString()),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
        }));
  }
}
