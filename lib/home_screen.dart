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
    final allUsersAsync = ref.watch(allUsersProvider);
    final currentUserId = FirebaseAuth.instance.currentUser;
    final currentUserDataAsync = ref.watch(
      userDataProvider(currentUserId!.uid),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Hello"),
        centerTitle: true,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
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
            child: Text("Sign out", style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: allUsersAsync.when(
          data: (userData) {
            return ListView.builder(
              itemCount: userData.length,
              itemBuilder: (contex, index) {
                var data = userData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Card(
                    elevation: 5,
                    color: const Color.fromARGB(255, 84, 24, 248),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person, size: 50),
                          ),
                          SizedBox(height: 10),
                          Text(
                            data.name,
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                          currentUserDataAsync.when(
                            data: (currentUserData) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Center(child: Text("Voice")),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Center(child: Text("Video")),
                                    ),
                                  ),
                                ],
                              );
                            },
                            error: (error, stackTrace) =>
                                Text(error.toString()),
                            loading: () =>
                                Center(child: CircularProgressIndicator()),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
