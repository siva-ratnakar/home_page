import 'package:flutter/material.dart';
import 'package:siva_website/constants/constants.dart';
import 'package:siva_website/main.dart';
import 'package:siva_website/utils/helper.dart';

part 'src/body.dart';
part 'src/header.dart';

class ProfessionalPage extends StatelessWidget {
  const ProfessionalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProfessionalHeader(),
            Expanded(child: ProfessionalBody()),
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
