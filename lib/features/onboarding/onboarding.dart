import 'package:flutter/material.dart';
import 'package:mendomarket/core/app_colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Descubrí productos locales únicos.",
      "description": "Conectate con emprendimientos de tu ciudad y apoyá sus productos",
      "image": "assets/images/onboarding01.png",
    },
    {
      "title": "Explorá categorías personalizadas",
      "description": "Encontrá desde impresiones 3D hasta calcomanías o productos personalizados",
      "image": "assets/images/onboarding02.png",
    },
    {
      "title": "Crecé y hacé crecer",
      "description": "Publicá tus servicios y ayudá a tu comunidad",
      "image": "assets/images/onboarding03.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(data['image']!, height: 300),
                      const SizedBox(height: 40),
                      Text(
                        data['title']!,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A7C59),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        data['description']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Indicadores
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentIndex == index ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? const Color(0xFF4A7C59) : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),

          // Botón
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4A7C59),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                if (_currentIndex < onboardingData.length - 1) {
                  _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                } else {
                  // Ir al login
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: Text(
                _currentIndex == onboardingData.length - 1 ? 'Comenzar' : 'Siguiente',
                style: const TextStyle(fontSize: 16, color: AppColors.backgroundColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
