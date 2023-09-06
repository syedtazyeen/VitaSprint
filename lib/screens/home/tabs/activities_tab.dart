import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vita_sprint/screens/home/widgets/grid_card.dart';
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
            return const Center(child: Text("Something went wrong!"));
          }
        });
  }
}

class ActivitiesView extends StatelessWidget {
  final state;
  const ActivitiesView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.appBlue,
          ),
          height: 420,
          padding: const EdgeInsets.only(top: 64, bottom: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text("Today's Activity"),
                const Padding(padding: EdgeInsets.all(12)),
                CircleProgress(
                  title: "${state.currentSteps}",
                  subtitle: "Steps",
                  radius: 70.0,
                  width: 10.0,
                  percent: 0.7,
                  progressColor: AppColors.progressColor1,
                ),
                const Padding(padding: EdgeInsets.all(12)),
                Row(
                  children: [
                    ActivityItem(
                      title: "kCal Burnt",
                      value: "324.46",
                      icon: Icons.whatshot,
                      iconColor: Colors.deepOrange,
                      iconBg: Colors.white38,
                    ),
                    ActivityItem(
                      title: "Distance",
                      value: "32.46",
                      icon: Icons.directions,
                      iconColor: Colors.brown,
                      iconBg: Colors.white38,
                    ),
                    ActivityItem(
                      title: "Time",
                      value: "45 min",
                      icon: Icons.alarm_on,
                      iconColor: Colors.teal,
                      iconBg: Colors.white38,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
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
                      color: Colors.transparent,
                    ),
                    height: 400,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HorizontalCard(),
                          Container(
                              padding: const EdgeInsets.only(top: 24, left: 24),
                              child: const Text("Metrics", style: TextStyle(fontWeight: FontWeight.w600))
                          ),
                          GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(20),
                            physics: const NeverScrollableScrollPhysics(),
                            children: [GridCard(), GridCard(), GridCard()],
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
