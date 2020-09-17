import 'package:flutter/material.dart';
import 'package:hepsiburada_clone/category_screen.dart';

class AnaYapi extends StatefulWidget {
  @override
  _AnaYapiState createState() => _AnaYapiState();
}

class _AnaYapiState extends State<AnaYapi> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Keşfet',
      style: optionStyle,
    ),
    CategoryScreen(),
    Text(
      'Sepet',
      style: optionStyle,
    ),
    Text(
      'Siparişlerim',
      style: optionStyle,
    ),
    Text(
      'HepsiExpress',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          buildBottomNavigationBarItem("Keşfet", Icon(Icons.home)),
          buildBottomNavigationBarItem("Kategoriler", Icon(Icons.category)),
          buildBottomNavigationBarItem("Sepet", Icon(Icons.shopping_basket)),
          buildBottomNavigationBarItem("Siparişlerim", Icon(Icons.card_travel)),
          buildBottomNavigationBarItem("Hepsiexpress", Icon(Icons.explore))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.black,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String title, Icon icon) {
    return BottomNavigationBarItem(
        icon: icon,
        title: Container(margin: EdgeInsets.only(top: 5), child: Text(title)));
  }
}
