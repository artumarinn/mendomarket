import 'package:flutter/material.dart';
import 'package:mendomarket/core/app_colors.dart';
import 'package:mendomarket/widgets/common/custom_app_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Login',
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Center(
            child: Container(
              height: 500,
              child: Text("Crea una cuenta", style: TextStyle(
                fontSize: 32,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins', 
              ),),
            ),
          ),
          Text("Nombre Completo"),
        ],
      )
    );
  }
}