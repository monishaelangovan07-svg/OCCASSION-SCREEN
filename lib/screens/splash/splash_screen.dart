import 'dart:async';
import 'package:flutter/material.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 15),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F2),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFA53A),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.temple_buddhist,
                    size: 50,
                    color: Colors.brown,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Aaradhana",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8A4F08),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "SPIRITUAL JOURNEY AWAITS",
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 14,
                    color: Color(0xFFB08A3A),
                  ),
                ),

                const SizedBox(height: 30),

                Container(
                  width: 70,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4A62A),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                const SizedBox(height: 50),

                const Text(
                  '"Experience the divine through\nmodern convenience and ancient\nwisdom."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 30),

                const SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Color(0xFF8A4F08),
                  ),
                ),

                const SizedBox(height: 40),

                const Text(
                  "SECURED & TRUSTED BY DEVOTEES",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black38,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}