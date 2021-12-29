import 'package:flutter/material.dart';
import 'package:movies/screens/home_tabs/movie_detials.dart';

import '../screens/browseCategory/browse_tab.dart';
import '../screens/search_tab.dart';
import '../screens/watch_list_tab.dart';
import '../screens/home_tabs/home_tab.dart';
import '../main.dart';
class homeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<homeScreen> createState() => _homeScreenState();
}
class _homeScreenState extends State<homeScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar:
      BottomNavigationBar(
        onTap: (index) {
          currentPageIndex = index;
          setState(() {});
        },
        currentIndex: currentPageIndex,
        items: [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/homeIcon.png',), size: 30,), label:'Home'),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/search.png',), size: 30,), label:'Search'),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/browse.png',), size: 30,), label:'browse'),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/watchList.png',), size: 30,), label:'WatchList'),

        ],
      ),
      body: getCurrentPage(),
    );
  }

  Widget getCurrentPage() {
    if (currentPageIndex == 0) {
      return HomeTab();
    } else if (currentPageIndex == 1) {
      return SearchTab();
    } else if (currentPageIndex == 2) {
      return BrowseTab();
    }
    else{
      return WatchListTab();
    }
  }
}
