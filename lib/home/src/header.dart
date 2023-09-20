part of '../home.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                            fontFamily: Constants.siteTitleFontFamily,
                            fontWeight: FontWeight.w500,
                            letterSpacing: Constants.siteTitleLetterSpacing,
                          ),
                      child: const TitleTextWidget(),
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

class TitleTextWidget extends StatefulWidget {
  const TitleTextWidget({
    super.key,
  });

  @override
  State<TitleTextWidget> createState() => _TitleTextWidgetState();
}

class _TitleTextWidgetState extends State<TitleTextWidget> {
  late bool _hovered;
  late bool _isWebMobile;

  @override
  void initState() {
    super.initState();
    _hovered = false;
    _isWebMobile = PlatformHelper.isWebMobile;

    // set to color social images when on mobile
    if (_isWebMobile) _hovered = true;
  }

  setHoveredWeb(bool hovered) {
    if (!_isWebMobile) {
      setState(() {
        _hovered = hovered;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setHoveredWeb(true),
      onExit: (_) => setHoveredWeb(false),
      child: Text.rich(TextSpan(
        children: [
          const TextSpan(text: Constants.siteTitleFirst),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: AnimatedSwitcher(
              duration: Constants.defaultDuration,
              child: AnimatedHeaderTitle(
                hovered: _hovered,
              ),
            ),
          ),
          const TextSpan(text: Constants.siteTitleLast),
        ],
      )),
    );
  }
}

class AnimatedHeaderTitle extends StatelessWidget {
  const AnimatedHeaderTitle({
    super.key,
    required this.hovered,
  });

  final bool hovered;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Constants.siteTitleLetterSpacing * 4,
      child: AnimatedSwitcher(
        duration: Constants.defaultDuration,
        child: hovered
            ? const Image(image: AssetImage(Constants.siteTitleAnmateImagePath))
            : const Text.rich(
                TextSpan(text: Constants.siteTitleAnimate),
              ),
      ),
    );
  }
}
