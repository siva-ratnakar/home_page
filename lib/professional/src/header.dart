part of '../professional.dart';

class ProfessionalHeader extends StatelessWidget {
  const ProfessionalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(immadisairaj): add click to go home (check nav stack then go?)

    return Container(
      color: Colors.black,
      height: MediaQuery.sizeOf(context).height * 0.1,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                child: SizedBox(
                  height: 60,
                  width: 800,
                  child: Center(
                    child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontFamily:
                                Constants.siteProfessionalTitleFontFamily,
                            fontWeight: FontWeight.w500,
                            letterSpacing: Constants.siteTitleLetterSpacing,
                            color: Colors.white,
                          ),
                      child: const Text('Professional'),
                      // child: const TitleTextWidget(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const WholeDivider(),
        ],
      ),
    );
  }
}
