part of '../home.dart';

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

class NameBack extends StatelessWidget {
  const NameBack({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        height: 100,
        width: 100,
        child: Center(
          child: Text(
            Constants.siteOwnerCircleName,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontFamily: Constants.siteNameFontFamily,
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}

class ImageWithAsset extends StatelessWidget {
  const ImageWithAsset({super.key, required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(asset),
      fit: BoxFit.cover,
    );
  }
}

class BigWidgetWrapper extends StatelessWidget {
  const BigWidgetWrapper({
    super.key,
    required this.child,
    this.isTransparent = false,
    this.isNotClippable = false,
  });

  final Widget child;
  final bool isTransparent;
  final bool isNotClippable;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipBehavior: isNotClippable ? Clip.none : Clip.antiAlias,
      child: Container(
        height: Constants.bigWidgetSize,
        width: Constants.bigWidgetSize,
        color: isTransparent ? null : Theme.of(context).colorScheme.background,
        child: child,
      ),
    );
  }
}

class FooterIcon extends StatefulWidget {
  const FooterIcon({super.key, required this.socialIcons});

  final SocialIcons socialIcons;

  @override
  State<FooterIcon> createState() => _FooterIconState();
}

class _FooterIconState extends State<FooterIcon> {
  late bool _hovered;
  late bool _isWebMobile;

  @override
  void initState() {
    super.initState();
    _hovered = false;
    _isWebMobile = PlatformHelper.isWebMobile;

    // set to b/w social images when on mobile
    if (_isWebMobile) _hovered = false;
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
    final size = min(MediaQuery.sizeOf(context).height * 0.08,
        MediaQuery.sizeOf(context).width / 9);
    return MouseRegion(
      onEnter: (_) => setHoveredWeb(true),
      onExit: (_) => setHoveredWeb(false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => LinksHelper.openInNewTab(widget.socialIcons.link),
        child: SizedBox(
          height: size,
          width: size,
          child: AnimatedSwitcher(
            duration: Constants.defaultDuration,
            child: Image(
              image: AssetImage(
                _hovered
                    ? widget.socialIcons.imagePath
                    : widget.socialIcons.blackImagePath,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
