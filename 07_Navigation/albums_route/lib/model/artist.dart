class Artist {
  Artist({this.name, this.link, this.about});

  factory Artist.fromJson(Map<String, dynamic> parsedJsonArtist) => Artist(
        name: parsedJsonArtist['name'] as String,
        link: parsedJsonArtist['link'] as String,
        about: parsedJsonArtist['about'] as String,
      );

  String name;
  String link;
  String about;
}

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
