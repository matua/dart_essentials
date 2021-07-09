import 'package:albums_route/model/artist.dart';
import 'package:flutter/material.dart';

class ArtistDetailsPage extends StatelessWidget {
  const ArtistDetailsPage({Key key}) : super(key: key);

  static const String routeName = '/artist_details';

  @override
  Widget build(BuildContext context) {
    final Artist artist = ModalRoute.of(context).settings.arguments as Artist;

    return Scaffold(
      appBar: AppBar(
        title: Text(artist.name),
      ),
      body: SingleChildScrollView(child: Text(artist.about)),
    );
  }
}
