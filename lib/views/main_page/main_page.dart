import 'package:ecommercesetec/views/category/category_page.dart';
import 'package:ecommercesetec/views/favorite/favorite_page.dart';
import 'package:ecommercesetec/views/home/home_page.dart';
import 'package:ecommercesetec/views/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget{
  String routeName='/main_page';
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index=0;
  var _page=[
    HomePage(),
    CategoryPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: index == 0 ? Drawer():null,
      appBar: index == 0 ? AppBar():null,
      body: _page[index],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.red,
          showUnselectedLabels: true,
          currentIndex: index,
          onTap: (int newIndex){
            index=newIndex;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                label: 'Category'
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: 'Favorite'
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile'
            )
          ]),
    );
  }
}