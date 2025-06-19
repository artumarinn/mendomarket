import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
      child: Container(
        width: double.infinity, 
        height: 130, 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect( 
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/images/banners/banner.png', 
            fit: BoxFit.cover, 
          ),
        ),
      ),
    );
  }
}