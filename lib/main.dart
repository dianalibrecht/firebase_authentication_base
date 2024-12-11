import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text('Dumbledore`s Login Session'),
              SizedBox(height: 16),
              ElevatedButton(onPressed: null, child: Text("Einloggen")),
              SizedBox(height: 16),
              Text("Soll veränderbar sein per Einloggen oder Ausloggen"),
              ElevatedButton(onPressed: null, child: Text("Ausloggen")),
            ],
          ),
        ),
      ),
    );
  }
}
