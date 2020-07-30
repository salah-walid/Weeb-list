import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:Weeblist/core/models/MangaChapteeData.dart';

class MangaData {
  String title;
  String author;
  String description;
  String mangaCover;
  List<MangaChapterData> listChapters;
  MangaData({
    this.title,
    this.author,
    this.description,
    this.mangaCover,
    this.listChapters,
  });

  MangaData copyWith({
    String title,
    String author,
    String description,
    String mangaCover,
    List<MangaChapterData> listChapters,
  }) {
    return MangaData(
      title: title ?? this.title,
      author: author ?? this.author,
      description: description ?? this.description,
      mangaCover: mangaCover ?? this.mangaCover,
      listChapters: listChapters ?? this.listChapters,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'description': description,
      'mangaCover': mangaCover,
      'listChapters': listChapters?.map((x) => x?.toMap())?.toList(),
    };
  }

  static MangaData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return MangaData(
      title: map['title'],
      author: map['author'],
      description: map['description'],
      mangaCover: map['mangaCover'],
      listChapters: List<MangaChapterData>.from(map['listChapters']?.map((x) => MangaChapterData.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static MangaData fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'MangaData(title: $title, author: $author, description: $description, mangaCover: $mangaCover, listChapters: $listChapters)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is MangaData &&
      o.title == title &&
      o.author == author &&
      o.description == description &&
      o.mangaCover == mangaCover &&
      listEquals(o.listChapters, listChapters);
  }

  @override
  int get hashCode {
    return title.hashCode ^
      author.hashCode ^
      description.hashCode ^
      mangaCover.hashCode ^
      listChapters.hashCode;
  }
}
