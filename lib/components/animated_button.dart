import 'package:flutter/material.dart';
import 'package:simple_animated_icon/simple_animated_icon.dart';

class AnimatedIconButton extends StatefulWidget {
  @override
  _AnimatedIconButtonState createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton>
    with SingleTickerProviderStateMixin {
  bool _isOpened = false;
  late AnimationController _animationController;
  late Animation<double> _progress;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });

    _progress =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void animate() {
    if (_isOpened) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }

    setState(() {
      _isOpened = !_isOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: animate,
        icon: SimpleAnimatedIcon(
          startIcon: Icons.arrow_upward,
          endIcon: Icons.arrow_upward_outlined,
          progress: _progress,
        ));
  }
}
