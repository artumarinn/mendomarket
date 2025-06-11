import 'package:flutter/material.dart';
import 'package:mendomarket/features/chat/chat_page.dart';
import 'package:mendomarket/features/favorite/favorite_page.dart';
import 'package:mendomarket/features/login/login_page.dart';
import 'package:mendomarket/features/onboarding/onboarding.dart';
import 'package:mendomarket/features/profile/profile_page.dart';
import 'package:mendomarket/features/search/search_page.dart';
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
      initialRoute: '/onboarding', 
      routes: {
        '/onboarding': (context) => const OnboardingPage(),
        '/home': (context) => const HomePage(),
        '/search': (context) => const SearchPage(),
        '/chat': (context) => ChatPage(),
        '/favorite': (context) => const FavoritePage(),
        '/profile': (context) => const ProfilePage(),
        '/login': (context) => const LoginPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}