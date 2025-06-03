import 'package:flutter/material.dart';
import 'package:mendomarket/widgets/common/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'MendoMarket'),
      body: Center(
        child: Text(
          'Welcome to MendoMarket!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}