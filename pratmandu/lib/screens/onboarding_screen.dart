import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

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

              /// LOGO ICON ONLY
              Image.asset("assets/images/logo_icon.png", height: 50),

              const SizedBox(height: 30),

              /// MAIN ILLUSTRATION
              Expanded(
                child: Image.asset(
                  "assets/images/onboarding/onboarding_1.png",
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 20),

              /// TITLE
              const Text(
                "Order Your Favorite Food",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              /// SUBTITLE
              const Text(
                "Browse through a variety of restaurants and cuisines.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),

              const SizedBox(height: 30),

              /// PAGE INDICATOR
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _dot(isActive: true),
                  _dot(isActive: false),
                  _dot(isActive: false),
                ],
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
                      // TODO: Navigate to Onboarding Screen 2
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
                    child: const Text("Next", style: TextStyle(fontSize: 16)),
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

  /// DOT INDICATOR WIDGET
  static Widget _dot({required bool isActive}) {
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
