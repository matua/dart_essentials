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
