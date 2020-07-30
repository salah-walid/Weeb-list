import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:Weeblist/core/models/AnimeEpisodeData.dart';

class AnimeData {
  String title;
  String author;
  int get episodesCount => episodesList?.length;
  String animeImage;
  List<AnimeEpisodeData> episodesList;
  String description;
  AnimeData({
    this.title,
    this.author,
    this.animeImage,
    this.episodesList,
    this.description,
  });

  AnimeData copyWith({
    String title,
    String author,
    String animeImage,
    List<AnimeEpisodeData> episodesList,
    String description,
  }) {
    return AnimeData(
      title: title ?? this.title,
      author: author ?? this.author,
      animeImage: animeImage ?? this.animeImage,
      episodesList: episodesList ?? this.episodesList,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'animeImage': animeImage,
      'episodesList': episodesList?.map((x) => x?.toMap())?.toList(),
      'description': description,
    };
  }

  static AnimeData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return AnimeData(
      title: map['title'],
      author: map['author'],
      animeImage: map['animeImage'],
      episodesList: List<AnimeEpisodeData>.from(map['episodesList']?.map((x) => AnimeEpisodeData.fromMap(x))),
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  static AnimeData fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'AnimeData(title: $title, author: $author, animeImage: $animeImage, episodesList: $episodesList, description: $description)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is AnimeData &&
      o.title == title &&
      o.author == author &&
      o.animeImage == animeImage &&
      listEquals(o.episodesList, episodesList) &&
      o.description == description;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      author.hashCode ^
      animeImage.hashCode ^
      episodesList.hashCode ^
      description.hashCode;
  }
}
