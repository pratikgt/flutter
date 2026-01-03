// import 'package:flutter/material.dart';
// import 'login_page.dart';

// class SignupScreen extends StatelessWidget {
//   const SignupScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 40),

//               /// LOGO
//               Image.asset('assets/images/logo.png', height: 80),

//               const SizedBox(height: 20),

//               /// APP NAME
//               const Text(
//                 'PRATMANDU',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFFE53935),
//                 ),
//               ),

//               const SizedBox(height: 40),

//               /// TITLE
//               const Text(
//                 'Create Account',
//                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
//               ),

//               const SizedBox(height: 30),

//               ///////textfields//////////
//               _inputField(
//                 hintText: 'Full Name',
//                 icon: Icons.person_outline,
//                 obscureText: false,

//                 ///name ko lagi obscureText false gareko
//               ),

//               const SizedBox(height: 16),

//               _inputField(
//                 hintText: 'Email Address',
//                 icon: Icons.email_outlined,
//                 obscureText: false,
//               ),

//               const SizedBox(height: 16),

//               _inputField(
//                 hintText: 'Password',
//                 icon: Icons.lock_outline,
//                 obscureText: true,
//               ),

//               const SizedBox(height: 16),

//               _inputField(
//                 hintText: 'Confirm Password',
//                 icon: Icons.lock_outline,
//                 obscureText: true,
//               ),

//               const SizedBox(height: 30),

//               /////////////////signup button//////////////
//               SizedBox(
//                 width: double.infinity,
//                 height: 52,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     /////////signup logic garna baaki//////////
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFE53935),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(28),
//                     ),
//                   ),
//                   child: const Text('Sign Up', style: TextStyle(fontSize: 16)),
//                 ),
//               ),

//               const SizedBox(height: 25),

//               /////////////login ma feri jaane//////////
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text('Already have an account? '),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (_) => const LoginPage()),
//                       );
//                     },
//                     child: const Text(
//                       'Log in',
//                       style: TextStyle(
//                         color: Color(0xFFE53935),
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// INPUT FIELD WIDGET
//   static Widget _inputField({
//     required String hintText,
//     required IconData icon,
//     required bool obscureText,
//   }) {
//     return TextField(
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         hintText: hintText,
//         prefixIcon: Icon(icon),
//         contentPadding: const EdgeInsets.symmetric(vertical: 16),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(14),
//           borderSide: const BorderSide(color: Colors.grey),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(14),
//           borderSide: const BorderSide(color: Color(0xFFE53935)),
//         ),
//       ),
//     );
//   }
// }
