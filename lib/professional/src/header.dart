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
                  Flexible(
                    flex: 0,
                    fit: FlexFit.loose,
                    child: TitleIconButtonWrapper(
                      child: IconButton(
                        onPressed: () => context.go(NavigationRoutes.home.path),
                        padding: _iconButtonPadding,
                        icon: const Icon(Icons.home_outlined),
                        color: _foregroundColor,
                        iconSize: _iconSize,
                        tooltip: 'Go Home!',
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ProfessionalHeaderTitle(
                      foregroundColor: _foregroundColor,
                      iconButtonPadding: _iconButtonPadding,
                      iconSize: _iconSize,
                    ),
                  ),
                  Flexible(
                    flex: 0,
                    fit: FlexFit.loose,
                    child: TitleIconButtonWrapper(
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
  const ProfessionalHeaderTitle(
      {super.key,
      required Color foregroundColor,
      required EdgeInsets iconButtonPadding,
      required double iconSize})
      : _foregroundColor = foregroundColor,
        _iconButtonPadding = iconButtonPadding,
        _iconSize = iconSize;

  final Color _foregroundColor;
  final EdgeInsets _iconButtonPadding;
  final double _iconSize;

  @override
  State<ProfessionalHeaderTitle> createState() =>
      _ProfessionalHeaderTitleState();
}

class _ProfessionalHeaderTitleState extends State<ProfessionalHeaderTitle> {
  final _scrollController = ProfessionalScreenHelper().scrollController;
  late final _titleController;
  final showArrows = !PlatformHelper.isWebMobile;
  final sections = Constants.professionalItems.length;

  late int _currentSection;
  @override
  void initState() {
    super.initState();

    _titleController = PageController();

    _currentSection = 1;
    _scrollController.addListener(listener);
  }

  @override
  dispose() {
    _scrollController.removeListener(listener);
    super.dispose();
  }

  listener() {
    if (_scrollController.hasClients) {
      final currentOffset = _scrollController.offset;
      final maxOffset = _scrollController.position.maxScrollExtent;

      var currentSection = (currentOffset / maxOffset * sections).ceil();
      currentSection = currentSection < 1 ? 1 : currentSection;
      currentSection = currentSection > sections ? sections : currentSection;

      if (currentSection != _currentSection) {
        setState(() {
          _currentSection = currentSection;
        });

        titleGoToSection(_currentSection);
      }
    }
  }

  goToSection(int goTo) {
    if (_currentSection == 1 && goTo < _currentSection) return;
    if (_currentSection == sections && goTo > _currentSection) return;

    if (_scrollController.hasClients) {
      final maxOffset = _scrollController.position.maxScrollExtent;
      final goToOffset = maxOffset / (sections - 1) * (goTo - 1);

      _scrollController.animateTo(
        goToOffset,
        duration: Constants.defaultDuration,
        curve: Curves.easeInOut,
      );
    }
  }

  titleGoToSection(int goTo) {
    if (_titleController.hasClients) {
      final maxOffset = _titleController.position.maxScrollExtent;
      final goToOffset = maxOffset / (sections - 1) * (goTo - 1);

      _titleController.animateTo(
        goToOffset,
        duration: Constants.defaultDuration,
        curve: Curves.easeInOut,
      );
    }
  }

  goPrevious() => goToSection(_currentSection - 1);

  goNext() => goToSection(_currentSection + 1);

  @override
  Widget build(BuildContext context) {
    var professionalHeaderJustTitle = ProfessionalHeaderJustTitle(
      widget: widget,
      controller: _titleController,
    );
    final hideLeft = _currentSection == 1;
    final hideRight = _currentSection == sections;
    return showArrows
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedOpacity(
                opacity: hideLeft ? 0 : 1,
                duration: Constants.defaultDuration,
                child: TitleIconButtonWrapper(
                  child: IconButton(
                    onPressed: hideLeft ? null : goPrevious,
                    padding: widget._iconButtonPadding,
                    icon: const Icon(Icons.keyboard_double_arrow_left_sharp),
                    iconSize: widget._iconSize,
                    color: widget._foregroundColor,
                    tooltip: hideLeft ? null : 'Previous Section',
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: professionalHeaderJustTitle,
              ),
              AnimatedOpacity(
                opacity: hideRight ? 0 : 1,
                duration: Constants.defaultDuration,
                child: TitleIconButtonWrapper(
                  child: IconButton(
                    onPressed: hideRight ? null : goNext,
                    padding: widget._iconButtonPadding,
                    icon: const Icon(Icons.keyboard_double_arrow_right_sharp),
                    iconSize: widget._iconSize,
                    color: widget._foregroundColor,
                    tooltip: hideRight ? null : 'Next Section',
                  ),
                ),
              ),
            ],
          )
        : professionalHeaderJustTitle;
  }
}

class ProfessionalHeaderJustTitle extends StatelessWidget {
  const ProfessionalHeaderJustTitle({
    super.key,
    required this.widget,
    required this.controller,
  });

  final ProfessionalHeaderTitle widget;
  final PageController controller;
  // final int _currentSection;

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
              // using page view to do the swipe transition
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: controller,
                itemCount: Constants.professionalItems.length,
                itemBuilder: (context, index) => Center(
                  child: Text(Constants.professionalItems[index].title),
                ),
              ),
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
    return FittedBox(
      child: SizedBox(
        height: 60,
        width: 60,
        child: child,
      ),
    );
  }
}
