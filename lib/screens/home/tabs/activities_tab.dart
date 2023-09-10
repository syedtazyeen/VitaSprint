import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedometer/pedometer.dart';
import 'package:vitasprint/constants/app_colors.dart';
import 'package:vitasprint/widgets/circle_progress.dart';

import '../../../blocs/steps/steps_bloc.dart';
import '../../../utils/step_counter.dart';
import '../../../utils/steps_helper.dart';
import '../widgets/activities_item.dart';
import '../widgets/drop_down_alpha.dart';
import '../widgets/grid_card.dart';
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
        listener: (context, state) {
        },
        builder: (context, state) {
          if (state is StepsUpdatedState) {
            return ActivitiesView(state: state);
          } else {
            return  const Center(child: Text("error"),);
          }
        });
  }
}

class ActivitiesView extends StatelessWidget {
  final state;
  const ActivitiesView({super.key,required this.state});

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
          height: 340,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppColors.color4,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24))),
          child: CircleProgress(
            title: "${state!.currentSteps ?? 0}",
            subtitle: "Steps Today",
            radius: 96.0,
            width: 14.0,
            percent: calculatePercent(
                ((state!.currentSteps ?? 0) * 0.067 * 0.01),
                (7000 * 0.067 * 0.01)),
            progressColor: AppColors.color2,
          ),
        ),
        SafeArea(
            child: Container(
          margin: const EdgeInsets.only(top: 56),
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 200),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      ActivityItem(
                        title: "kCal Burnt",
                        value: ((StepsHelper()
                                    .getCaloriesFromSteps(state!.currentSteps??0) /
                                1000)
                            .toStringAsFixed(2)),
                        icon: Icons.whatshot,
                        iconColor: Theme.of(context).primaryColor,
                        iconBg: Colors.deepOrangeAccent,
                      ),
                      ActivityItem(
                        title: "Distance",
                        value:
                            "${(StepsHelper().getDistanceFromSteps(state!.currentSteps??0) / 1000).toStringAsFixed(2)} km",
                        icon: Icons.directions,
                        iconColor: Theme.of(context).primaryColor,
                        iconBg: Colors.blueAccent,
                      ),
                      ActivityItem(
                        title: "Time",
                        value: "--",
                        icon: Icons.alarm,
                        iconColor: Theme.of(context).primaryColor,
                        iconBg: const Color(0xff04ca49),
                      ),
                    ],
                  ))
            ],
          ),
        )),
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
                    height: 450,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.color3,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              height: 4,
                              width: 56,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColorLight,
                                  borderRadius: BorderRadius.circular(32)),
                            ),
                          ),
                          const HorizontalCard(),
                          Container(
                            padding: const EdgeInsets.only(top: 24, left: 24,right: 24),
                            child:  const Row(
                              children: [
                                Expanded(
                                  child: Text("Metrics",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                ),
                                DropdownAlpha()
                              ],
                            ),
                          ),
                          GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(20),
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              GridCard(
                                name: "Step Count",
                                value: state.currentSteps.toString(),
                                unit: "Steps",
                                icon: Icons.directions_run,
                                iconBg: AppColors.color4,
                                iconColor: Colors.white,
                              ),
                              GridCard(
                                name: "Distance",
                                value: (StepsHelper().getDistanceFromSteps(state!.currentSteps??0) / 1000).toStringAsFixed(2),
                                unit: "Km",
                                icon: Icons.directions,
                                iconBg: Colors.blueAccent,
                                iconColor: Colors.white,
                              ),
                              GridCard(
                                name: "Cal Burnt",
                                value: ((StepsHelper().getCaloriesFromSteps(state!.currentSteps??0) / 1000).toStringAsFixed(2)),
                                unit: "kCal",
                                icon: Icons.whatshot,
                                iconBg: Colors.deepOrangeAccent,
                                iconColor: Colors.white,
                              ),
                              GridCard(
                                name: "Duration",
                                value: "--",
                                unit: "mins",
                                icon: Icons.alarm,
                                iconBg: Colors.indigo,
                                iconColor: Colors.white,
                              ),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.all(40))
                        ]),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}



