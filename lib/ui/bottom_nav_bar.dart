import 'package:flutter/material.dart';
import 'package:spotifywithapi/ui/pages/artist_profile.dart';
import 'package:spotifywithapi/ui/pages/artist_screen.dart';
import 'package:spotifywithapi/ui/pages/home.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switchPage(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        ],
        selectedItemColor: const Color(0xff1ED760),
        backgroundColor: Colors.white,
        iconSize: 28,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}

Widget switchPage(int index) {
  switch (index) {
    case 0:
      return const Home();
    case 1:
      return const ProfileScreen();
    case 2:
      return const ArtistProfileScreen();
    default:
      return Container();
  }
}
