part of '../main.dart';

class WholeDivider extends StatelessWidget {
  const WholeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.titleBottomBorderWidth,
      color: Theme.of(context).colorScheme.onBackground,
    );
  }
}
