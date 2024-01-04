import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siva_website/constants/constants.dart';
import 'package:siva_website/main.dart';
import 'package:siva_website/utils/helper.dart';
import 'package:siva_website/utils/router.dart';

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
  const UnderConstruction({
    super.key,
    this.color = Colors.white12,
    this.textColor = Colors.white,
  });

  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Placeholder(
          color: color,
        ),
        Center(
          child: Text(
            'Please wait while we are building for you!',
            style: TextStyle(
              color: textColor,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
