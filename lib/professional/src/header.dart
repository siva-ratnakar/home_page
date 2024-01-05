part of '../professional.dart';

class ProfessionalHeader extends StatelessWidget {
  const ProfessionalHeader({super.key});

  final _foregroundColor = Colors.white;
  final _backgroundColor = Colors.black;
  final _iconSize = 38.0;
  final _iconButtonPadding = EdgeInsets.zero;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      height: MediaQuery.sizeOf(context).height * 0.1,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              // padding: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleIconButtonWrapper(
                    child: IconButton(
                      onPressed: () => context.go(NavigationRoutes.home.path),
                      padding: _iconButtonPadding,
                      icon: const Icon(Icons.home_outlined),
                      color: _foregroundColor,
                      iconSize: _iconSize,
                      tooltip: 'Go Home!',
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ProfessionalHeaderTitle(
                        foregroundColor: _foregroundColor),
                  ),
                  TitleIconButtonWrapper(
                    child: IconButton(
                      onPressed: () {
                        LinksHelper.openInNewTab(
                            'https://sivaratnakar.com/${Constants.resumePathName}');
                      },
                      padding: _iconButtonPadding,
                      icon: const Icon(CupertinoIcons.doc_text),
                      iconSize: _iconSize,
                      color: _foregroundColor,
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

class ProfessionalHeaderTitle extends StatefulWidget {
  const ProfessionalHeaderTitle({
    super.key,
    required Color foregroundColor,
  }) : _foregroundColor = foregroundColor;

  final Color _foregroundColor;

  @override
  State<ProfessionalHeaderTitle> createState() =>
      _ProfessionalHeaderTitleState();
}

class _ProfessionalHeaderTitleState extends State<ProfessionalHeaderTitle> {
  final _scrollController = ProfessionalScreenHelper().scrollController;

  late int currentSection;
  @override
  void initState() {
    super.initState();

    currentSection = 1;
    _scrollController.addListener(listener);
  }

  @override
  dispose() {
    _scrollController.removeListener(listener);
    super.dispose();
  }

  listener() {
    // TODO(immadisairaj): This is just to test for now, implement it completely
    if (_scrollController.hasClients) {
      final currentOffset = _scrollController.offset;
      final maxOffset = _scrollController.position.maxScrollExtent;
      final sections = Constants.professionalItems.length;

      var _currentSection = (currentOffset / maxOffset * sections).ceil();
      _currentSection = _currentSection == 0 ? 1 : _currentSection;

      if (_currentSection != currentSection) {
        setState(() {
          currentSection = _currentSection;
        });
      }

      // print(currentSection);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: FittedBox(
        child: SizedBox(
          height: 65,
          width: 550,
          child: Center(
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontFamily: Constants.siteProfessionalTitleFontFamily,
                    fontWeight: FontWeight.w500,
                    letterSpacing: Constants.siteTitleLetterSpacing,
                    color: widget._foregroundColor,
                  ),
              // TODO(immadisairaj): Try to add animations if possible
              child: AnimatedContainer(
                duration: Constants.defaultDuration,
                child:
                    Text(Constants.professionalItems[currentSection - 1].title),
              ),
              // child: const Text('Professional'),
            ),
          ),
        ),
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
