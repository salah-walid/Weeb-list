import 'package:Weeblist/core/models/AnimeData.dart';
import 'package:Weeblist/ui/widgets/TextWithContour.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimeDetailPage extends StatelessWidget {

  final AnimeData animeData;

  AnimeDetailPage({Key key, @required this.animeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            //! header
            Container(
              
              padding: EdgeInsets.fromLTRB(10, 10, 3, 15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(animeData.animeImage),
                  fit: BoxFit.cover,
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    animeData.animeImage,
                    fit: BoxFit.fill,
                    width: 100,
                    height: 150,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, top: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          //* anime title
                          TextWithContour(
                            animeData.title,
                            contourColor: Colors.black,
                            strokeWidth: 3,
                            style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.white,
                            ),
                          ),

                          //* anime author
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextWithContour(
                                "Author : ",
                                contourColor: Colors.black,
                                strokeWidth: 3,
                                style: Theme.of(context).textTheme.subtitle1.copyWith(
                                  color: Colors.white,
                                ),
                              ),

                              Flexible(
                                child: TextWithContour(
                                  "${animeData.author}",
                                  contourColor: Colors.black,
                                  strokeWidth: 3,
                                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),

                            ],
                          ),

                          //* anime description
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextWithContour(
                                "Description : ",
                                contourColor: Colors.black,
                                strokeWidth: 3,
                                style: Theme.of(context).textTheme.subtitle1.copyWith(
                                  color: Colors.white,
                                ),
                              ),

                              Flexible(
                                child: TextWithContour(
                                  "${animeData.description}",
                                  contourColor: Colors.black,
                                  strokeWidth: 3,
                                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //* anime description
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextWithContour(
                                "Number of episodes : ",
                                contourColor: Colors.black,
                                strokeWidth: 3,
                                style: Theme.of(context).textTheme.subtitle1.copyWith(
                                  color: Colors.white,
                                ),
                              ),

                              Flexible(
                                child: TextWithContour(
                                  "${animeData.episodesCount}",
                                  contourColor: Colors.black,
                                  strokeWidth: 3,
                                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            //!episodes lists
            Expanded(
              child: ListView.separated(
                itemCount: animeData.episodesCount,
                itemBuilder: (context, index){
                  return ListTile(
                    onTap: () async{
                      if(await canLaunch(animeData.episodesList[index].episodeLink))
                        await launch(animeData.episodesList[index].episodeLink);
                    },
                    title: Text(
                      "Episode ${animeData.episodesList[index].episodeNumber} : ${animeData.episodesList[index].episodeTitle}"
                    ),
                  );
                }, 
                separatorBuilder: (BuildContext context, int index) => Divider(
                  color: Colors.black,
                  thickness: 0.5,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}