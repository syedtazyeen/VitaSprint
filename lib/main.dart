import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:vita_sprint/blocs/steps/steps_bloc.dart';
import 'package:vita_sprint/providers/bottom_navigation_provider.dart';
import 'package:vita_sprint/screens/home/home_screen.dart';
import 'package:vita_sprint/constants/app_colors.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'data/local/models/steps/step_model.dart';


Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Required for Hive to work with StepModel
  Hive.registerAdapter(StepModelAdapter());

  // Initialize Hive and provide the path to store the Hive data
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  runApp(
    ChangeNotifierProvider(
      create: (context) => BottomNavigationProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final stepBloc =  StepsBloc();
  MyApp({super.key});

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
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.appGreeneDark),
        primaryColor: Colors.white,
        canvasColor: AppColors.bgColor1,
        useMaterial3: true,
        fontFamily: "Poppins",
      ),
      home: Scaffold(
        body: Center(
          child: Scaffold(
            body: BlocProvider(
              create: (context) => stepBloc,
              child: HomeScreen(),
            )
          ),
        )
      ),
    );
  }
}

