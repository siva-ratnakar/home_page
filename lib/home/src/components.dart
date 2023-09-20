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

class FlipAnimation extends StatefulWidget {
  const FlipAnimation({
    super.key,
    required this.front,
    required this.back,
    this.towardsLeft = true,
  });

  final Widget front;
  final Widget back;
  final bool towardsLeft;

  @override
  State<FlipAnimation> createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation> {
  late bool _hovered;

  late Widget _front;
  late Widget _back;
  late bool _towardsLeft;

  @override
  void initState() {
    super.initState();
    _towardsLeft = widget.towardsLeft;
    _hovered = false;
    _front = Center(key: const ValueKey(true), child: widget.front);
    _back = Center(key: const ValueKey(false), child: widget.back);
  }

  setHovered(bool hovered) {
    setState(() {
      _hovered = hovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: AnimatedSwitcher(
        duration: Constants.defaultDuration,
        transitionBuilder: __transitionBuilder,
        child: _hovered ? _back : _front,
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_hovered) != widget!.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        if (!_towardsLeft) tilt *= -1;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          alignment: Alignment.center,
          child: widget,
        );
      },
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
