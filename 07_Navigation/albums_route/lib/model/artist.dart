import 'dart:convert';

class Artist {
  Artist({this.name, this.link, this.about});

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        name: json['name'] as String,
        link: json['link'] as String,
        about: json['about'] as String,
      );

  String name;
  String link;
  String about;
}

class ArtistsList {
  ArtistsList({
    this.artists,
  });

  factory ArtistsList.fromJson(String jsonArtistsList) {
    final artistsList = jsonDecode(jsonArtistsList) as List<Artist>;
    return ArtistsList(artists: artistsList);
  }

  List<Artist> artists;
}

// class ArtistsList {
//   ArtistsList({
//     this.artists,
//   });
//
//   factory ArtistsList.fromJson(List<Map<String, dynamic>> jsonArtistsList) {
//     final List<Artist> artistsList = jsonArtistsList.map(
//             (Map<String, dynamic> jsonArtist) =>
//             Artist.fromJson(jsonArtist)).toList();
//     return ArtistsList(artists: artistsList);
//   }
//
//   List<Artist> artists;
// }
