import 'package:Weeblist/core/models/MangaData.dart';
import 'package:Weeblist/ui/widgets/TextWithContour.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MangaDetailPage extends StatelessWidget {

  final MangaData mangaData;

  const MangaDetailPage({Key key, this.mangaData}) : super(key: key);

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
                  image: NetworkImage(mangaData.mangaCover),
                  fit: BoxFit.cover,
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    mangaData.mangaCover,
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
                            mangaData.title,
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
                                  "${mangaData.author}",
                                  contourColor: Colors.black,
                                  strokeWidth: 4,
                                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                                    color: Colors.grey[300],
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
                                  "${mangaData.description}",
                                  contourColor: Colors.black,
                                  strokeWidth: 4,
                                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                                    color: Colors.grey[300],
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
                                "Number of chapters : ",
                                contourColor: Colors.black,
                                strokeWidth: 3,
                                style: Theme.of(context).textTheme.subtitle1.copyWith(
                                  color: Colors.white,
                                ),
                              ),

                              Flexible(
                                child: TextWithContour(
                                  "${mangaData.listChapters.length}",
                                  contourColor: Colors.black,
                                  strokeWidth: 4,
                                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                                    color: Colors.grey[300],
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
                itemCount: mangaData.listChapters.length,
                itemBuilder: (context, index){
                  return ListTile(
                    onTap: () async{
                      if(await canLaunch(mangaData.listChapters[index].chapterUrl))
                        await launch(mangaData.listChapters[index].chapterUrl);
                    },
                    title: Text(
                      "Volume ${mangaData.listChapters[index].volume}. Chapter ${mangaData.listChapters[index].chapter} : ${mangaData.listChapters[index].title}"
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