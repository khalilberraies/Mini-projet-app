import 'package:ai_project/screens/camera_live.dart';
import 'package:ai_project/screens/profile.dart';
import 'package:ai_project/screens/trans.dart';
import 'package:flutter/material.dart';

class mainscreen_page extends StatefulWidget {
  const mainscreen_page({super.key});

  @override
  State<mainscreen_page> createState() => _mainscreen_pageState();
}
int _selectedPageIndex = 0;
List<Widget> _screens = [

  CameraLive(),
  TranslatorApp(),
  profileuser(),
];
class _mainscreen_pageState extends State<mainscreen_page> {
  void setSelectedIndex(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      // appBar: AppBar(),
      bottomNavigationBar:
      BottomNavigationBar(

        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 84, 74, 74),
        selectedItemColor: Color.fromARGB(255, 38, 23, 208),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        unselectedItemColor: Color(0xFF686868),
        items: [

          BottomNavigationBarItem(icon: Icon(Icons.live_tv),
            label: "home",),
          BottomNavigationBarItem(icon:Icon(Icons.translate),
            label: "doorbell",),

          BottomNavigationBarItem(icon: Icon(Icons.person),
            label: "person",),


        ],

        currentIndex: _selectedPageIndex,
        onTap: setSelectedIndex,
      ),
      body: _screens[_selectedPageIndex],


    )
    );
  }
}