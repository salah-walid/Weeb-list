import 'dart:convert';

class AnimeEpisodeData {
  int episodeNumber;
  String episodeTitle;
  String episodeLink;
  AnimeEpisodeData({
    this.episodeNumber,
    this.episodeTitle,
    this.episodeLink,
  });

  AnimeEpisodeData copyWith({
    int episodeNumber,
    String episodeTitle,
    String episodeLink,
  }) {
    return AnimeEpisodeData(
      episodeNumber: episodeNumber ?? this.episodeNumber,
      episodeTitle: episodeTitle ?? this.episodeTitle,
      episodeLink: episodeLink ?? this.episodeLink,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'episodeNumber': episodeNumber,
      'episodeTitle': episodeTitle,
      'episodeLink': episodeLink,
    };
  }

  static AnimeEpisodeData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return AnimeEpisodeData(
      episodeNumber: map['episodeNumber'],
      episodeTitle: map['episodeTitle'],
      episodeLink: map['episodeLink'],
    );
  }

  String toJson() => json.encode(toMap());

  static AnimeEpisodeData fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'AnimeEpisodeData(episodeNumber: $episodeNumber, episodeTitle: $episodeTitle, episodeLink: $episodeLink)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is AnimeEpisodeData &&
      o.episodeNumber == episodeNumber &&
      o.episodeTitle == episodeTitle &&
      o.episodeLink == episodeLink;
  }

  @override
  int get hashCode => episodeNumber.hashCode ^ episodeTitle.hashCode ^ episodeLink.hashCode;
}
