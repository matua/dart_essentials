import 'dart:convert';

import 'package:albums_route/fetch_file.dart';
import 'package:albums_route/model/artist.dart';
import 'package:albums_route/model/artists_list.dart';
import 'package:albums_route/pages/artist_details.dart';
import 'package:albums_route/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class ArtistsPage extends StatelessWidget {
  const ArtistsPage({Key key}) : super(key: key);

  static const String routeName = '/artists';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artists'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: FutureBuilder<String>(
          future: fetchFileFromAssets('assets/artists.json'),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              final List<Artist> artists = ArtistsList.fromJson(
                      jsonDecode(snapshot.data) as List<dynamic>)
                  .artists;
              return ListView.builder(
                  itemCount: artists.length,
                  itemBuilder: (BuildContext _, int index) {
                    return ListTile(
                      title: Text(artists[index].name),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ArtistDetailsPage.routeName,
                          arguments: artists[index],
                        );
                      },
                    );
                  });
            }
            return const Text('Error');
          },
        ),
      ),
    );
  }
}
