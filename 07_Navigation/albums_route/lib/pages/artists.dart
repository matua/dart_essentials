import 'package:albums_route/fetch_file.dart';
import 'package:albums_route/model/artist.dart';
import 'package:flutter/material.dart';

class ArtistsPage extends StatelessWidget {
  ArtistsPage({Key key, this.test}) : super(key: key);

  final String test;

  static const String routeName = '/artists';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Artists'),
        ),
        body: Center(
            child: FutureBuilder<String>(
                future: fetchFileFromAssets('assets/artists.json'),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    final List<Artist> artists =
                        ArtistsList.fromJson(snapshot.data).artists;
                    return ListView.builder(
                        itemCount: artists.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Text(artists[index].name);
                        });
                  }
                })));
  }
}
