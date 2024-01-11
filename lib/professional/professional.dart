import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siva_website/constants/constants.dart';
import 'package:siva_website/main.dart';
import 'package:siva_website/professional/src/classes.dart';
import 'package:siva_website/utils/helper.dart';
import 'package:siva_website/utils/router.dart';

part 'src/body.dart';
part 'src/header.dart';

class ProfessionalPage extends StatefulWidget {
  const ProfessionalPage({super.key});

  @override
  State<ProfessionalPage> createState() => _ProfessionalPageState();
}

class _ProfessionalPageState extends State<ProfessionalPage> {
  precacheImages() {
    const imagePaths = Constants.cacheProfessionalImagePaths;
    for (var image in imagePaths) {
      precacheImage(Image.asset(image).image, context);
    }
  }

  @override
  void didChangeDependencies() {
    // pre cache all images needed
    precacheImages();
    super.didChangeDependencies();
  }

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
            'Please wait while we get data for you!',
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
