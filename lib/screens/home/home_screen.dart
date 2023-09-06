import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vita_sprint/screens/home/tabs/activities_tab.dart';
import 'package:vita_sprint/screens/home/tabs/articles_tab.dart';
import 'package:vita_sprint/screens/home/tabs/settings_tab.dart';
import 'package:vita_sprint/widgets/vita_bottom_navigation_bar.dart';
import '../../providers/bottom_navigation_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<BottomNavigationProvider>(context);

    return Container(
      child: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: navigationProvider.currentIndex,
              children: const <Widget>[
                ActivitiesTab(),
                ArticlesTab(),
                SettingsTab()
              ],
            ),
          ),
          VitaBottomNavigationBar(
            currentIndex: navigationProvider.currentIndex,
            onTap: (index) {
              navigationProvider.updateIndex(index);
            },
          )
        ],
      ),
    );
  }
}
