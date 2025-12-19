import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_zeego_proo/provider/user_provider.dart';
import 'package:new_zeego_proo/screens/login/send_otp.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authRepo = ref.read(authRepositoryProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Hello"),
        centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: () async {
              // Logout Logic
              try {
                await authRepo.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => SendOTPScreen()),
                );
              } catch (e) {
                print(e.toString());
              }
            },
            child: Text("Sign out"),
          ),
        ],
      ),
    );
  }
}
