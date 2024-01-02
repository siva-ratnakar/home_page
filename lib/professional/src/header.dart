part of '../professional.dart';

class ProfessionalHeader extends StatelessWidget {
  const ProfessionalHeader({super.key});

  final _iconColor = Colors.white;
  final _iconButtonPadding = EdgeInsets.zero;

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleIconButtonWrapper(
                    child: IconButton(
                      onPressed: () => context.go(NavigationRoutes.home.path),
                      padding: _iconButtonPadding,
                      icon: const Icon(Icons.home_outlined),
                      color: _iconColor,
                      tooltip: 'Go Home!',
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: FittedBox(
                        child: SizedBox(
                          height: 60,
                          width: 680,
                          child: Center(
                            child: DefaultTextStyle(
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontFamily: Constants
                                        .siteProfessionalTitleFontFamily,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing:
                                        Constants.siteTitleLetterSpacing,
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
                  TitleIconButtonWrapper(
                    child: IconButton(
                      onPressed: () {
                        LinksHelper.openInNewTab(
                            'https://sivaratnakar.com/${Constants.resumePathName}');
                      },
                      padding: _iconButtonPadding,
                      icon: const Icon(CupertinoIcons.doc_text),
                      color: _iconColor,
                      tooltip: 'View CV/Resumé',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const WholeDivider(),
        ],
      ),
    );
  }
}

class TitleIconButtonWrapper extends StatelessWidget {
  const TitleIconButtonWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 0,
      fit: FlexFit.loose,
      child: FittedBox(
        child: SizedBox(
          height: 60,
          width: 60,
          child: child,
        ),
      ),
    );
  }
}
