import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  final authInstance = FirebaseAuth.instance;
  MainApp({super.key});
  Stream<User?> get onAuthStateChanged => authInstance.authStateChanges();
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Future<void> logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("Logged out");
    } catch (e) {
      print(e);
    }
  }

  Future<void> loginUser() async {
    try {
      final loginUser = await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with anonym account.");
    } catch (e) {
      print(e);
      // switch (e.code) {
      //   case "operation-not-allowed":
      //     print("Anonymous auth hasn't been enabled for this project.");
      //     break;
      //   default:
      //     print(e.message);
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login Session'),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    loginUser();
                  },
                  child: const Text("Einloggen")),
              const SizedBox(height: 16),
              Text("Soll veränderbar sein per Einloggen oder Ausloggen"),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    logoutUser();
                  },
                  child: const Text("Ausloggen")),
            ],
          ),
        ),
      ),
    );
  }
}
