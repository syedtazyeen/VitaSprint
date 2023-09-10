import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircleProgress extends StatefulWidget {
  final String title;
  final String subtitle;
  final double radius;
  final double width;
  final double percent;
  final Color progressColor;

  const CircleProgress({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.radius,
    required this.percent,
    required this.width,
    required this.progressColor,
  }) : super(key: key);

  @override
  _CircleProgressState createState() => _CircleProgressState();
}

class _CircleProgressState extends State<CircleProgress> {
  int animDuration = 1000;

  @override
  void initState() {
    super.initState();
    // Set a delay before disabling the animation
    Future.delayed(const Duration(milliseconds: 750), () {
      if (mounted) {
        setState(() {
          animDuration = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
     alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
            Text(
              widget.subtitle,
              style: const TextStyle(
                fontSize: 13.0,
                color: Colors.white60,
              ),
            ),
          ],
        ),
        CircularPercentIndicator(
          radius: widget.radius,
          lineWidth: widget.width,
          animation: true,
          animationDuration: animDuration,
          startAngle: 180,
          //arcType: ArcType.FULL,
          percent: .7,
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: widget.progressColor,
          backgroundColor: Colors.white24,
        ),

      ],
    );
  }
}


