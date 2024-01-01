import 'package:flutter/material.dart';
import 'package:siva_website/constants/constants.dart';
import 'package:siva_website/utils/router.dart';

part 'src/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Siva Ratnakar Immadi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6D6EAD),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      routerConfig: CustomRouter.config,
    );
  }
}
