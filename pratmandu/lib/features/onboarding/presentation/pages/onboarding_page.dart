import 'package:flutter/material.dart';
import 'package:pratmandu/features/auth/presentation/pages/login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // LOGO
              Image.asset("assets/images/logo.png", height: 50),

              const SizedBox(height: 30),

              // PAGE VIEW
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  children: const [
                    _OnboardingContent(
                      image: "assets/images/onboarding_1.png",
                      title: "Order Your Favorite Food",
                      subtitle:
                          "Browse through a wide range of restaurants and cuisines.",
                    ),
                    _OnboardingContent(
                      image: "assets/images/onboarding_2.png",
                      title: "Fast & Reliable Delivery",
                      subtitle:
                          "Get your food delivered quickly and safely to your location.",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // DOT INDICATORS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: _currentIndex == index ? 18 : 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? const Color(0xFFE53935)
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // ACTION BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SKIP
                  TextButton(
                    onPressed: _goToLogin,
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),

                  // NEXT / GET STARTED
                  ElevatedButton(
                    onPressed: () {
                      if (_currentIndex < 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        _goToLogin();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE53935),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      _currentIndex == 1 ? "Get Started" : "Next",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ONBOARDING CONTENT
class _OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const _OnboardingContent({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 260,
          child: Image.asset(image, fit: BoxFit.contain),
        ),
        const SizedBox(height: 30),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
