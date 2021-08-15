import 'artist.dart';

class ArtistsList {
  ArtistsList({
    this.artists,
  });

  factory ArtistsList.fromJson(List<dynamic> parsedJsonArtists) {
    final List<Artist> artists = parsedJsonArtists
        .map((dynamic jsonArtist) =>
            Artist.fromJson(jsonArtist as Map<String, dynamic>))
        .toList();

    return ArtistsList(artists: artists);
  }

  List<Artist> artists;
}
