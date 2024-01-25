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

class FlipAnimation extends StatefulWidget {
  const FlipAnimation({
    super.key,
    required this.front,
    required this.back,
    this.towardsLeft = true,
    this.flipOnClickOnly = false,
  });

  final Widget front;
  final Widget back;
  final bool towardsLeft;
  final bool flipOnClickOnly;

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
    // don't update when only click
    if (widget.flipOnClickOnly) return;

    setState(() {
      _hovered = hovered;
    });
  }

  changeOnFlip() {
    // don't update when not click
    if (!widget.flipOnClickOnly) return;

    setState(() {
      _hovered = !_hovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetectorIfElseWrapper(
      gestureDetect: widget.flipOnClickOnly,
      onTap: changeOnFlip,
      child: MouseRegion(
        onEnter: (_) => setHovered(true),
        onExit: (_) => setHovered(false),
        cursor: widget.flipOnClickOnly
            ? SystemMouseCursors.click
            : MouseCursor.defer,
        child: AnimatedSwitcher(
          duration: Constants.defaultDuration,
          transitionBuilder: __transitionBuilder,
          child: _hovered ? _back : _front,
        ),
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

class GestureDetectorIfElseWrapper extends StatelessWidget {
  const GestureDetectorIfElseWrapper({
    super.key,
    required this.child,
    this.gestureDetect = false,
    this.onTap,
  });

  final Widget child;
  final bool gestureDetect;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    if (!gestureDetect) {
      return child;
    } else {
      return GestureDetector(
        onTap: onTap,
        child: child,
      );
    }
  }
}
