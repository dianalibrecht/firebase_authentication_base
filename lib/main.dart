import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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
              ElevatedButton(onPressed: () {}, child: Text("Einloggen")),
              const SizedBox(height: 16),
              Text("Soll veränderbar sein per Einloggen oder Ausloggen"),
              ElevatedButton(onPressed: () {}, child: Text("Ausloggen")),
            ],
          ),
        ),
      ),
    );
  }
}
