import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pedometer/pedometer.dart';
import 'package:provider/provider.dart';
import 'package:vitasprint/blocs/recipes/recipe_bloc.dart';
import 'package:vitasprint/blocs/steps/steps_bloc.dart';
import 'package:vitasprint/data/remote/firebase_service.dart';
import 'package:vitasprint/data/remote/repositories/recipe_repository.dart';
import 'package:vitasprint/providers/bottom_navigation_provider.dart';
import 'package:vitasprint/providers/theme_provider.dart';
import 'package:vitasprint/screens/home/home_screen.dart';
import 'package:vitasprint/constants/app_colors.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'data/local/models/steps/step_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and provide the path to store the Hive data
  await Hive.initFlutter();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  // Required for Hive to work with StepModel
  Hive.registerAdapter(StepModelAdapter());

  // Initialize Firebase
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (context) => BottomNavigationProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final stepBloc = StepsBloc();
  MyApp({super.key});

  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      primaryColorLight: Colors.black,
      useMaterial3: true,
      fontFamily: "Poppins",
      scaffoldBackgroundColor: Color(0xFFE5E5E5));

  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      primaryColorLight: Colors.white,
      useMaterial3: true,
      fontFamily: "Poppins",
      scaffoldBackgroundColor: Color(0xff3c3c3c));

  var systemLight = const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light
  );

  var systemDark = const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light
  );
  //
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if(ThemeMode.system == ThemeMode.dark){
      SystemChrome.setSystemUIOverlayStyle(systemLight);
    }
    else {
      SystemChrome.setSystemUIOverlayStyle(systemLight);
    }

    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: lightTheme,
            themeMode: ThemeMode.system,
            home: Scaffold(
                body: Center(
              child: Scaffold(
                  body: BlocProvider(
                create: (context) => stepBloc,
                child: HomeScreen(),
              )),
            )),
          );
        },
      ),
    );
  }
}


