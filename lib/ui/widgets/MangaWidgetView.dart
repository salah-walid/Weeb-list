import 'package:Weeblist/core/managers/RoutesManager.dart';
import 'package:Weeblist/ui/shared/DummyData.dart';
import 'package:Weeblist/ui/widgets/TextWithContour.dart';
import 'package:flutter/material.dart';

class MangaWidgetView extends StatelessWidget {

  const MangaWidgetView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio:0.8),
      itemCount: DummyData.mangaData.length,
      itemBuilder: (context, index){
        return GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(RoutesManager.mangaDetail, arguments: DummyData.mangaData[index]),
          child: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              
              image: DecorationImage(
                image: NetworkImage(DummyData.mangaData[index].mangaCover),
                
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 5.0,
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),

            child: Align(
              alignment: Alignment.bottomRight,
              child: TextWithContour(
                DummyData.mangaData[index].title,
                contourColor: Colors.black,
                strokeWidth: 4,
                style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Colors.white,
                ),
              ),
            )
          ),
        );
      }
    );
  }
}