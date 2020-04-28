import 'package:flutter/material.dart';
import 'package:mealsapp/screens/categories_%20screen.dart';
import 'package:mealsapp/screens/favorites_screen.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final String barOption = 'BottomTabBar'; // 'AppTabBar' 'BottomTabBar'

  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Your Favorites'}
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return barOption == 'AppTabBar'
        ? DefaultTabController(
            //initialIndex: 1, // ilk açılışta hangi tab'ın seçili olacağını belirliyor, 0 by default
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Meals'),
                centerTitle: true,
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.category),
                      text: 'Categories',
                    ),
                    Tab(
                      icon: Icon(Icons.favorite),
                      text: 'Favorites',
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  CategoriesScreen(),
                  FavoritesScreen(),
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(_pages[_selectedPageIndex]['title']),
            ),
            drawer: MainDrawer(),
            body: _pages[_selectedPageIndex]['page'],
            bottomNavigationBar: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.white,
              selectedItemColor: Theme.of(context).accentColor,
              currentIndex: _selectedPageIndex,
              //type: BottomNavigationBarType.shifting, // shifting kullanırken itemlerin arka renklerini de eklemen gerek
              items: [
                BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icon(Icons.category),
                  title: Text('Categories'),
                ),
                BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icon(Icons.favorite),
                  title: Text('Favorites'),
                ),
              ],
            ),
          );
  }
}
