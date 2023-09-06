import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vita_sprint/providers/bottom_navigation_provider.dart';
import 'package:vita_sprint/screens/home/home_screen.dart';
import 'package:vita_sprint/constants/app_colors.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BottomNavigationProvider(),
      child: MyApp(),
    ),
  );
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
    ));
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: Colors.white,
        canvasColor: AppColors.bgColor1,
        useMaterial3: true,
        fontFamily: "Poppins",
      ),
      home: const Scaffold(
        body: Center(
          child: Scaffold(
            body: HomeScreen()
          ),
        )
      ),
    );
  }
}

