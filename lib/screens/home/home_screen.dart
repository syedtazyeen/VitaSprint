import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitasprint/screens/home/tabs/activities_tab.dart';
import 'package:vitasprint/screens/home/tabs/explore_tab.dart';
import 'package:vitasprint/screens/home/tabs/settings_tab.dart';
import 'package:vitasprint/widgets/vita_bottom_navigation_bar.dart';
import '../../providers/bottom_navigation_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<BottomNavigationProvider>(context);

    return  Stack(
      alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: IndexedStack(
              index: navigationProvider.currentIndex,
              children: const <Widget>[
                ActivitiesTab(),
                ExploreTab(),
                SettingsTab()
              ],
            )
          ),
          VitaBottomNavigationBar(
            currentIndex: navigationProvider.currentIndex,
            onTap: (index) {
              navigationProvider.updateIndex(index);
            },
          )
        ],
    );
  }
}
