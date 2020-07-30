import 'package:Weeblist/ui/widgets/AnimeWidgetView.dart';
import 'package:Weeblist/ui/widgets/MangaWidgetView.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final labelTextStyle =
        Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 20.0);
    return SafeArea(
      child: Scaffold(
        body: PageView(

          controller: _pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index){
            setState(() {
              _selectedIndex = index;
            });
          },

          children: <Widget>[
            //anime tab
            AnimeWidgetView(),
            //manga tab
            MangaWidgetView(),
          ],

        ),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 8,
          currentIndex: _selectedIndex,
          selectedLabelStyle: labelTextStyle,
          unselectedLabelStyle: labelTextStyle,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.linear);
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/totoro.png"),
                size: 40,
              ),
              title: Text("Anime")
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/comic.png"),
                size: 40,
              ),
              title: Text("Manga")
            ),
          ],
        ),
      ),
    );
  }
}