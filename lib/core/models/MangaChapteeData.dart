import 'dart:convert';

class MangaChapterData {
  String title;
  int volume;
  int chapter;
  String chapterUrl;
  MangaChapterData({
    this.title,
    this.volume,
    this.chapter,
    this.chapterUrl,
  });

  MangaChapterData copyWith({
    String title,
    int volume,
    int chapter,
    String chapterUrl,
  }) {
    return MangaChapterData(
      title: title ?? this.title,
      volume: volume ?? this.volume,
      chapter: chapter ?? this.chapter,
      chapterUrl: chapterUrl ?? this.chapterUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'volume': volume,
      'chapter': chapter,
      'chapterUrl': chapterUrl,
    };
  }

  static MangaChapterData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return MangaChapterData(
      title: map['title'],
      volume: map['volume'],
      chapter: map['chapter'],
      chapterUrl: map['chapterUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  static MangaChapterData fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'MangaChapterData(title: $title, volume: $volume, chapter: $chapter, chapterUrl: $chapterUrl)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is MangaChapterData &&
      o.title == title &&
      o.volume == volume &&
      o.chapter == chapter &&
      o.chapterUrl == chapterUrl;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      volume.hashCode ^
      chapter.hashCode ^
      chapterUrl.hashCode;
  }
}
