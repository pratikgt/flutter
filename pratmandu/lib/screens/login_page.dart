import 'package:flutter/material.dart';
import 'package:pratmandu/screens/home_screen.dart';
import 'package:pratmandu/screens/signup_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              /////////////// LOGO////////////
              Image.asset("assets/images/logo.png", height: 80),

              const SizedBox(height: 20),

              const Text(
                "PRATMANDU",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE53935),
                ),
              ),

              const SizedBox(height: 40),

              //////////// TITLE////////////////
              const Text(
                "Login",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 30),

              /////////////// EMAIL FIELD////////////
              _inputField(
                hintText: "Email address",
                icon: Icons.email_outlined,
                obscureText: false,
              ),

              const SizedBox(height: 16),

              // //////////////PASSWORD FIELD////////////
              _inputField(
                hintText: "Password",
                icon: Icons.lock_outline,
                obscureText: true,
              ),

              const SizedBox(height: 8),

              //////////////FORGOT PASSWORD/////////////
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {}, /////////garna baaki//////////
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(color: Color(0xFFE53935)),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ////////////////LOGIN BUTTON//////////////
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE53935),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text("Log In", style: TextStyle(fontSize: 16)),
                ),
              ),

              const SizedBox(height: 30),

              ///////////////SIGN UP////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignupScreen()),
                      );
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Color(0xFFE53935),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /////////////INPUT FIELD///////////////
  static Widget _inputField({
    required String hintText,
    required IconData icon,
    required bool obscureText,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE53935)),
        ),
      ),
    );
  }
}
