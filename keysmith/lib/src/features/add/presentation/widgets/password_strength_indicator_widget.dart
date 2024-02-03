import 'package:flutter/material.dart';

///Creates an instance of [PasswordStrengthIndicatorWidget].
///
class PasswordStrengthIndicatorWidget extends StatefulWidget {
  ///This [animationController] is used to animate the position and colour
  ///of the indicator.
  ///
  final AnimationController animationController;

  ///A range of colours to be displayed on the indicator.
  ///
  final Animatable<Color?>? indicatorColors;

  ///Background colour of the indicator.
  ///
  final Color? backgroundColor;

  ///Changes colour and length of the indicator based on value
  ///provided by [animationController].
  ///
  ///Note if the colours displayed by the indicator needs to be changed,
  ///consider providing [indicatorColors] value for the
  ///range of [double] from 0.0 to 1.0.
  ///
  const PasswordStrengthIndicatorWidget({
    super.key,
    required this.animationController,
    this.indicatorColors,
    this.backgroundColor,
  });

  @override
  State<PasswordStrengthIndicatorWidget> createState() =>
      _PasswordStrengthIndicatorWidgetState();
}

class _PasswordStrengthIndicatorWidgetState
    extends State<PasswordStrengthIndicatorWidget> {
  late AnimationController _animationController;
  late Animation<Color?> _currentIndicatorAnimatedColor;
  late Animation<double> _progress;

  late Animatable<Color?> _animatedInidcatorColor;

  @override
  void initState() {
    super.initState();
    _animationController = widget.animationController;
    _animatedInidcatorColor = widget.indicatorColors ??
        TweenSequence<Color?>([
          TweenSequenceItem(
            weight: 1.0,
            tween: ColorTween(begin: Colors.red, end: Colors.amber),
          ),
          TweenSequenceItem(
            weight: 1.0,
            tween: ColorTween(begin: Colors.amber, end: Colors.yellow),
          ),
          TweenSequenceItem(
            weight: 1.0,
            tween: ColorTween(begin: Colors.yellow, end: Colors.green),
          ),
        ]);
//Always animate the animatable values in initState, since initState isn't
//called each time a widget is built.
    _currentIndicatorAnimatedColor =
        _animatedInidcatorColor.animate(_animationController);
    _progress =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return LinearProgressIndicator(
            backgroundColor: widget.backgroundColor ?? Colors.grey[300],
            value: _progress.value,
            color: _currentIndicatorAnimatedColor.value,
          );
        });
  }
}
