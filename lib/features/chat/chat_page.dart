import 'package:flutter/material.dart';
import 'package:mendomarket/widgets/common/custom_app_bar.dart';
import 'package:mendomarket/widgets/common/custom_nav_bar.dart';
import 'package:mendomarket/widgets/common/underConstructionPage.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Chat', centerTitle: true),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: const UnderConstructionPage(
        imagePath: 'assets/images/onboarding/underConstruction.png',
        message: '¡Estamos trabajando en la sección de chat!',
        subMessage: 'Vuelve pronto para ver las novedades.',
        title: 'Chat',
      ),
    );
  }
}
