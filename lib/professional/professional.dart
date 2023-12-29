import 'package:flutter/material.dart';

class ProfessionalPage extends StatelessWidget {
  const ProfessionalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Professional'),
      ),
      body: const Stack(
        children: [
          Placeholder(
            color: Colors.black12,
          ),
          Center(
            child: Text(
              'Under Consturction!',
              style: TextStyle(
                color: Colors.indigoAccent,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
