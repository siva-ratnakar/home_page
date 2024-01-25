part of '../home.dart';

class CircleWrapper extends StatelessWidget {
  const CircleWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final size = min(constraints.maxHeight, constraints.maxWidth) * 0.3;
      return Container(
        height: size,
        width: size,
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.onBackground,
            width: Constants.homeCircleBorderWidth,
          ),
        ),
        child: ClipOval(child: child),
      );
    });
  }
}

class NameStack extends StatefulWidget {
  const NameStack({
    super.key,
  });

  @override
  State<NameStack> createState() => _NameStackState();
}

class _NameStackState extends State<NameStack> {
  late bool _hovered;
  late bool _isWebMobile;

  @override
  void initState() {
    super.initState();
    _hovered = false;
    _isWebMobile = PlatformHelper.isWebMobile;
  }

  setHoveredWeb(bool hovered) {
    if (!_isWebMobile) {
      setState(() {
        _hovered = hovered;
      });
    }
  }

  setClickHoverMobile() {
    if (_isWebMobile) {
      setState(() {
        _hovered = !_hovered;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setClickHoverMobile(),
      child: MouseRegion(
        onEnter: (_) => setHoveredWeb(true),
        onExit: (_) => setHoveredWeb(false),
        child: Stack(
          children: [
            const Positioned.fill(
              child: NameBack(),
            ),
            const ImageWithAsset(asset: Constants.ownerImagePath)
                .animate(target: _hovered ? 1 : 0)
                .slideY(begin: -1, duration: Constants.defaultDuration),
          ],
        ),
      ),
    );
  }
}

class MoveWrapper extends StatefulWidget {
  const MoveWrapper({
    super.key,
    required this.movable,
    required this.nonMovable,
    this.nonMovableCompleteTop,
    this.movableCompleteTop,
    this.isMovableOnTop = false,
    this.moveOffset = 15,
    this.moveOnlyLeftRight = false,
    this.moveOnlyTopBottom = false,
  });

  final Widget movable;
  final Widget nonMovable;
  final Widget? nonMovableCompleteTop;
  final Widget? movableCompleteTop;

  final double moveOffset;
  final bool moveOnlyLeftRight;
  final bool moveOnlyTopBottom;

  final bool isMovableOnTop;

  @override
  State<MoveWrapper> createState() => _MoveWrapperState();
}

class _MoveWrapperState extends State<MoveWrapper> {
  late double localX;
  late double localY;
  late bool defaultPosition;

  @override
  void initState() {
    super.initState();
    localX = 0;
    localY = 0;
    defaultPosition = true;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // max height and max width is same
      final localSize = constraints.maxHeight;
      double percentageX = (localX / localSize) * 100;
      double percentageY = (localY / localSize) * 100;

      double move = widget.moveOffset;
      return MouseRegion(
        onEnter: (event) => setState(() {
          defaultPosition = false;
        }),
        onExit: (event) {
          setState(() {
            localX = Constants.bigWidgetSize / 2;
            localY = Constants.bigWidgetSize / 2;
            defaultPosition = true;
          });
        },
        onHover: (event) {
          if (mounted) {
            setState(() {
              defaultPosition = false;
            });
          }
          if (event.localPosition.dx > 0 && event.localPosition.dy > 0) {
            if (event.localPosition.dx < localSize &&
                event.localPosition.dy < localSize) {
              setState(() {
                localX = event.localPosition.dx;
                localY = event.localPosition.dy;
              });
            }
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (widget.isMovableOnTop) widget.nonMovable,
            Transform(
              transform: Matrix4.identity()
                ..translate(
                  defaultPosition || widget.moveOnlyTopBottom
                      ? 0.0
                      : (move * (percentageX / 50) + -move),
                  defaultPosition || widget.moveOnlyLeftRight
                      ? 0.0
                      : (move * (percentageY / 50) + -move),
                  0.0,
                ),
              alignment: FractionalOffset.center,
              child: widget.movable,
            ),
            if (!widget.isMovableOnTop) widget.nonMovable,
            if (widget.nonMovableCompleteTop != null)
              widget.nonMovableCompleteTop!,
            if (widget.movableCompleteTop != null)
              Transform(
                transform: Matrix4.identity()
                  ..translate(
                    defaultPosition
                        ? 0.0
                        : -((move / 4) * (percentageX / 50) + -(move / 4)),
                    defaultPosition
                        ? 0.0
                        : -((move / 4) * (percentageY / 50) + -(move / 4)),
                    0.0,
                  ),
                alignment: FractionalOffset.center,
                child: widget.movableCompleteTop,
              ),
          ],
        ),
      );
    });
  }
}
