import 'package:Weeblist/core/models/AnimeData.dart';
import 'package:Weeblist/core/models/AnimeEpisodeData.dart';
import 'package:Weeblist/core/models/MangaChapteeData.dart';
import 'package:Weeblist/core/models/MangaData.dart';

class DummyData {

  //! anime dummy list
  static List<AnimeData> animeData = [
    AnimeData(
      title: "Boku No Hero Academia",
      author: "Horikoshi Kouhei",
      description: "Society with super power, izuku midoriya gets super powers...",
      animeImage: "https://upload.wikimedia.org/wikipedia/en/thumb/5/5a/Boku_no_Hero_Academia_Volume_1.png/220px-Boku_no_Hero_Academia_Volume_1.png",
      episodesList: [
        AnimeEpisodeData(
          episodeTitle: "Izuku Midoriya: Origin",
          episodeNumber: 1,
          episodeLink: "https://www.crunchyroll.com/fr/my-hero-academia/episode-1-izuku-midoriya-origin-730707"
        ),
      ],
    ),

    AnimeData(
      title: "Shingeki no kyojin",
      author: "Isayama Hajime",
      animeImage: "https://www.blow-ent.com/wp-content/uploads/2020/05/shingeki-no-kyojin-1146311.png",
      description: "Titans attack people, peoples defend themselves",
      episodesList: [
        AnimeEpisodeData(
          episodeTitle: "To You, in 2000 Years: The Fall of Shiganshina, Part 1",
          episodeNumber: 1,
          episodeLink: "https://www.crunchyroll.com/fr/attack-on-titan/episode-1-to-you-2000-years-in-the-future-the-fall-of-zhiganshina-1-623251"
        ),
      ],
    ),
  ];

  //! manga dummy list
  static List<MangaData> mangaData = [
    MangaData(
      title: "Komi-San Wa Komyushou Desu",
      author: "Oda Tomohiti",
      mangaCover: "https://www.nautiljon.com/images/manga/00/18/comi-san_wa_comy-shou_desu_6481.jpg",
      description: "Komi-san is the beautiful and admirable girl that no-one can take their eyes off her. Almost the whole school sees her as the cold beauty out of their league, but Tadano Shigeo knows the truth: she's just really bad at communicating with others",
      listChapters: [
        MangaChapterData(
          volume: 1,
          chapter: 0,
          title: "One Shot",
          chapterUrl: "http://fanfox.net/manga/komi_san_wa_komyushou_desu/v00/c000/1.html", 
        ),
        MangaChapterData(
          volume: 1,
          chapter: 1,
          title: "A normal person",
          chapterUrl: "http://fanfox.net/manga/komi_san_wa_komyushou_desu/v01/c001/1.html", 
        ),
      ]
    )
  ];
}