import 'package:flutter/material.dart';
import 'package:mendomarket/widgets/common/custom_app_bar.dart';
import 'package:mendomarket/widgets/common/underConstructionPage.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Notificaciones', centerTitle: true),
      body: const UnderConstructionPage(
        imagePath: 'assets/images/onboarding/underConstruction.png',
        message: '¡Estamos trabajando en la sección de chat!',
        subMessage: 'Vuelve pronto para ver las novedades.',
        title: 'Chat',
      ),
    );
  }
}