import 'package:flutter/material.dart';
import 'package:siva_website/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siva Ratnakar Immadi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6D6EAD),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        // colorScheme: const ColorScheme(
        //   brightness: Brightness.light,
        //   primary: Colors.black,
        //   onPrimary: Colors.white,
        //   secondary: Colors.white,
        //   onSecondary: Colors.black,
        //   error: Colors.red,
        //   onError: Colors.white,
        //   background: Colors.white,
        //   onBackground: Colors.black,
        //   surface: Colors.white,
        //   onSurface: Colors.black,
        // ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
