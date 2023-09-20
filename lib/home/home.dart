import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:siva_website/constants/constants.dart';
import 'package:siva_website/helper.dart';

part 'src/body.dart';
part 'src/components.dart';
part 'src/enums.dart';
part 'src/footer.dart';
part 'src/header.dart';
part 'src/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            HomeHeader(),
            Expanded(child: HomeBody()),
            HomeFooter(),
          ],
        ),
      ),
    );
  }
}
