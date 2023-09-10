import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vitasprint/constants/app_colors.dart';

class CircleProgress extends StatefulWidget {
  final String title;
  final String subtitle;
  final double radius;
  final double width;
  final double percent;
  final Color progressColor;

  CircleProgress({
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
            Container(
              //margin: EdgeInsets.only(top: 40),
              child:  Text(
                widget.subtitle,
                style: const TextStyle(
                  fontSize: 13.0,
                  color: Colors.white60,
                ),
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








// class CircleProgress extends StatelessWidget {
//   String title, subtitle;
//   double radius, width, percent;
//   Color progressColor;
//   bool shouldAnimate = true;
//
//   CircleProgress(
//       {super.key,
//       required this.title,
//       required this.subtitle,
//       required this.radius,
//       required this.percent,
//       required this.width,
//       required this.progressColor});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Center(
//           child: CircularPercentIndicator(
//             radius: radius,
//             lineWidth: width,
//             animation: shouldAnimate,
//             animationDuration: 1000,
//             startAngle: 180,
//             // Start angle (180 degrees for a semi-circle)
//             percent: percent,
//             // Set the progress percentage (0.0 to 1.0)
//             //center:
//             circularStrokeCap: CircularStrokeCap.round,
//             progressColor: progressColor,
//             backgroundColor: Colors.white38,
//           ),
//         ),
//         Column(
//           children: [
//             Text(
//               title, // Display the percentage text
//               style: const TextStyle(fontSize: 22.0, color: AppColors.appGreeneDark),
//             ),
//             Text(
//               subtitle, // Display the percentage text
//               style: const TextStyle(fontSize: 14.0, color: Colors.black38),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }








// class SemiCircleProgress extends StatelessWidget {
//   const SemiCircleProgress({super.key});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Center(
//           child: CircularPercentIndicator(
//             radius: 70.0,
//             lineWidth: 10.0,
//             animation: true,
//             animationDuration: 1000,
//             startAngle: 180, // Start angle (180 degrees for a semi-circle)
//             percent: 0.7, // Set the progress percentage (0.0 to 1.0)
//             //center:
//             circularStrokeCap: CircularStrokeCap.round,
//             progressColor: Color(0xff0c2c52),
//             backgroundColor: Colors.white38,
//           ),
//         ),
//         const Column(
//           children: [
//             Text(
//               '7845', // Display the percentage text
//               style: TextStyle(
//                 fontSize: 22.0,
//                 color: Color(0xff0c2c52),
//               ),
//             ),
//             Text(
//               'Steps', // Display the percentage text
//               style: TextStyle(fontSize: 14.0, color: Colors.black38),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }