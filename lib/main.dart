import 'package:flutter/material.dart';
import 'package:mendomarket/features/chat/chat_page.dart';
import 'package:mendomarket/features/favorite/favorite_page.dart';
import 'features/home/home_page.dart';  

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MendoMarket',
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        // '/search': (context) => const SearchPage(),
        '/chat': (context) => ChatPage(),
        '/favorite': (context) => const FavoritePage(),
        // '/profile': (context) => const ProfilePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}