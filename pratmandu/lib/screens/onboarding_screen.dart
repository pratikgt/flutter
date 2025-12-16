import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

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

              /// LOGO ICON
              Image.asset("assets/images/logo_icon.png", height: 50),

              const SizedBox(height: 30),

              /// PAGE VIEW
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  children: const [
                    _OnboardingContent(
                      image: "assets/images/onboarding/onboarding_1.png",
                      title: "Order Your Favorite Food",
                      subtitle:
                          "Browse through a variety of restaurants and cuisines.",
                    ),
                    _OnboardingContent(
                      image: "assets/images/onboarding/onboarding_2.png",
                      title: "Fast & Reliable Delivery",
                      subtitle:
                          "Get your food delivered quickly and reliably to your door.",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// DOT INDICATORS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) => _dot(isActive: index == _currentIndex),
                ),
              ),

              const SizedBox(height: 25),

              /// BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// SKIP
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to Login screen
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),

                  /// NEXT
                  ElevatedButton(
                    onPressed: () {
                      if (_currentIndex < 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        // TODO: Navigate to Login screen
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

  /// DOT WIDGET
  Widget _dot({required bool isActive}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 16 : 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFE53935) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

/// REUSABLE ONBOARDING CONTENT
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
      children: [
        Expanded(child: Image.asset(image, fit: BoxFit.contain)),

        const SizedBox(height: 20),

        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ],
    );
  }
}
