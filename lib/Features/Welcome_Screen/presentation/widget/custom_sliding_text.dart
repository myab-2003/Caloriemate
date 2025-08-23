import 'package:flutter/material.dart';

class CustomSlidingText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;
  final double x;
  final double y;
  

  const CustomSlidingText({
    super.key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 1200),
    required this.x,
    required this.y,
    
  });

  @override
  State<CustomSlidingText> createState() => _CustomSlidingTextState();
}

class _CustomSlidingTextState extends State<CustomSlidingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slidingAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _slidingAnimation = Tween<Offset>(
      begin: Offset(
        widget.x,
        widget.y,
       

      ),
      end: Offset.zero,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slidingAnimation,
      child: Text(
        widget.text,
        style: widget.style,
        textAlign: TextAlign.center,
      ),
    );
  }
}
