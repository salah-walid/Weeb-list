import 'package:Weeblist/core/managers/RoutesManager.dart';
import 'package:Weeblist/ui/shared/DummyData.dart';
import 'package:Weeblist/ui/widgets/TextWithContour.dart';
import 'package:flutter/material.dart';

class AnimeWidgetView extends StatefulWidget {
  AnimeWidgetView({Key key}) : super(key: key);

  @override
  _AnimeWidgetViewState createState() => _AnimeWidgetViewState();
}

class _AnimeWidgetViewState extends State<AnimeWidgetView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index){
        return GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(RoutesManager.animeDetail, arguments: DummyData.animeData[index]),
          child: Container(
            decoration: BoxDecoration(
              
              image: DecorationImage(
                image: NetworkImage(DummyData.animeData[index].animeImage),
                
                fit: BoxFit.fitWidth,
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
            margin: EdgeInsets.fromLTRB(5, 15, 5, 10),
            height: 150,
            child: Align(
              alignment: Alignment.bottomRight,
              child: TextWithContour(
                DummyData.animeData[index].title,
                contourColor: Colors.black,
                strokeWidth: 4,
                style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Colors.white,
                ),
              ),
            )
          ),
        );
      },
      separatorBuilder: (_, index) => Divider(
        color: Colors.black,
        thickness: 0.5,
        indent: 50,
        endIndent: 50,
      ), 
      itemCount: DummyData.animeData.length
    );
  }
}