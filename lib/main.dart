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
  // immer konstruktor z. 18, immer state (und firebase sachen)
  final authInstance = FirebaseAuth.instance;
  MainApp({super.key});
  Stream<User?> get onAuthStateChanged => authInstance.authStateChanges();

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // alle Variablen, funtionen und UI
  String? text;

  @override
  void initState() {
    super.initState();
  }

  Future<void> logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("Logged out");
      setState(() {
        text = null;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> loginUser() async {
    try {
      final loginUser = await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with anonym account.");
      setState(() {
        text = "User ist eingeloggt";
      });
    } catch (e) {
      print(e);
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
              const Text(
                'Simple Anonym Login Session',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    loginUser();
                  },
                  child: const Text("Einloggen")),
              const SizedBox(height: 16),
              if (text !=
                  null) //wenn die Text variable nicht null ist, dann (unten) zeigen wir den text an.
                Text(
                  text!,
                  style: TextStyle(color: Colors.green),
                ),
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
