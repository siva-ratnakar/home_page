import 'package:flutter/material.dart';
import 'package:siva_website/helper.dart';

class ProfessionalPage extends StatelessWidget {
  const ProfessionalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Professional'),
      ),
      body: Scrollbar(
        controller: ProfessionalScreenHelper().scrollController,
        thumbVisibility: true,
        child: ListWheelScrollView(
          physics: const FixedExtentScrollPhysics(),
          controller: ProfessionalScreenHelper().scrollController,
          useMagnifier: true,
          magnification: 1.25,
          itemExtent: MediaQuery.sizeOf(context).height * 0.8,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              color: Colors.red,
              child: const UnderConstruction(),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              color: Colors.green,
              child: const UnderConstruction(),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              color: Colors.blue,
              child: const UnderConstruction(),
            ),
          ],
        ),
      ),
    );
  }
}

class UnderConstruction extends StatelessWidget {
  const UnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Placeholder(
          color: Colors.white12,
        ),
        Center(
          child: Text(
            'Please wait while we are building for you!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
