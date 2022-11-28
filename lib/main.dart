import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotifywithapi/provider/provider.dart';
import 'package:spotifywithapi/ui/pages/artist_profile.dart';
import 'package:spotifywithapi/ui/pages/artist_screen.dart';
import 'package:spotifywithapi/ui/pages/home.dart';
import 'package:spotifywithapi/ui/pages/search.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => GeneralViewModel(),
      ),
    ], builder: (context, child) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> pages = [
    const Home(),
    const SearchPage(),
    ArtistProfileScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, GeneralViewModel value, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: pages[value.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            ],
            selectedItemColor: const Color(0xff1ED760),
            backgroundColor: Colors.white,
            iconSize: 28,
            unselectedItemColor: Colors.grey,
            currentIndex: value.selectedIndex,
            onTap: (index) {
              value.onItemTapped(index);
            },
          ),
        );
      },
    );
  }
}
