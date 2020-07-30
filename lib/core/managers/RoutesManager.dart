import 'package:Weeblist/core/models/AnimeData.dart';
import 'package:Weeblist/core/models/MangaData.dart';
import 'package:Weeblist/ui/pages/AnimeDetailPage/AnimeDetailPage.dart';
import 'package:Weeblist/ui/pages/MainPage/MainPage.dart';
import 'package:Weeblist/ui/pages/MangaDetailPage.dart/MangaDetailPage.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static const String mainPage = "/";
  static const String animeDetail = "/animeDetail";
  static const String mangaDetail = "/mangaDetail";

  static Map<String, Widget Function(BuildContext)> generateRoutes(){
    return{

      RoutesManager.mainPage: (_) => MainPage(),
      RoutesManager.animeDetail: (context) {
        AnimeData animeData = ModalRoute.of(context).settings.arguments as AnimeData;
        return AnimeDetailPage(animeData: animeData,);
      },
      RoutesManager.mangaDetail: (context) {
        MangaData mangaData = ModalRoute.of(context).settings.arguments as MangaData;
        return MangaDetailPage(mangaData: mangaData,);
      }

    };
  }
}