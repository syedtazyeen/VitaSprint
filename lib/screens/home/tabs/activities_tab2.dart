import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vitasprint/screens/home/widgets/grid_card.dart';
import 'package:vitasprint/utils/steps_helper.dart';
import '../../../blocs/steps/steps_bloc.dart';
import '../../../constants/app_colors.dart';
import '../../../utils/step_counter.dart';
import '../../../widgets/circle_progress.dart';
import '../widgets/activities_item.dart';
import '../widgets/horizontal_card.dart';

class ActivitiesTab extends StatefulWidget {
  const ActivitiesTab({super.key});

  @override
  State<ActivitiesTab> createState() => _ActivitiesTabState();
}

class _ActivitiesTabState extends State<ActivitiesTab> {
  final stepBloc = StepsBloc();

  @override
  void initState() {
    super.initState();
    StepCounter(stepBloc: stepBloc);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StepsBloc, StepsState>(
        bloc: stepBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is StepsUpdatedState) {
            return ActivitiesView(state: state);
          } else {
            return const Center(
              child: Text("Error"),
            );
          }
        });
  }
}

class ActivitiesView extends StatelessWidget {
  final state;
  const ActivitiesView({super.key, required this.state});

  double calculatePercent(double s, double t) {
    if (s == null || t == null) return 0;
    if (s / t <= 1 && s / t >= 0) {
      return s / t;
    } else if (s / t > 1) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              //color: Color(0x28FF6E40),
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [Colors.white,  AppColors.appMain], // Define your gradient colors
              // ),
              ),
          height: 460,
          padding: const EdgeInsets.only(top: 80, bottom: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CircleProgress(
                  title: "${state.currentSteps}",
                  subtitle: "Steps Today",
                  radius: 96.0,
                  width: 14.0,
                  percent: calculatePercent((state.currentSteps * 0.067 * 0.01),
                      (7000 * 0.067 * 0.01)),
                  progressColor: Colors.deepOrange,
                ),
                const Padding(padding: EdgeInsets.all(12)),
                // Row(
                //   children: [
                //     ActivityItem(
                //       title: "kCal Burnt",
                //       value: ((StepsHelper()
                //                   .getCaloriesFromSteps(state.currentSteps) /
                //               1000)
                //           .toStringAsFixed(2)),
                //       icon: Icons.whatshot,
                //       iconColor: Colors.deepOrange,
                //       iconBg: Colors.white38,
                //     ),
                //     ActivityItem(
                //       title: "Distance",
                //       value:
                //           "${(StepsHelper().getDistanceFromSteps(state.currentSteps) / 1000).toStringAsFixed(2)} km",
                //       icon: Icons.directions,
                //       iconColor: Colors.brown,
                //       iconBg: Colors.white38,
                //     ),
                //     ActivityItem(
                //       title: "Time",
                //       value: "--",
                //       icon: Icons.alarm_on,
                //       iconColor: Colors.teal,
                //       iconBg: Colors.white38,
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
        Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      //color: Color(0x28FF6E40),
                    ),
                    height: 440,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.all(8),
                              height: 4,
                              width: 56,
                              decoration: BoxDecoration(
                                  color: AppColors.appMain3,
                                  borderRadius: BorderRadius.circular(32)),
                            ),
                          ),
                          HorizontalCard(),
                          Container(
                              padding: const EdgeInsets.only(top: 24, left: 24),
                              child: const Text("Metrics",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600))),
                          GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(20),
                            physics: const NeverScrollableScrollPhysics(),
                            //children: [GridCard(), GridCard(), GridCard()],
                          )
                        ]),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

