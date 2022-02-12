import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app/layout/travel_layout.dart';
import 'package:travel_app/modules/category_trips_screen.dart';
import 'package:travel_app/modules/trips_details_screen.dart';
import 'package:travel_app/shared/bloc_observer.dart';

void main() {

  //Bloc.observer =  MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // English, no country code
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const TravelLayout(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
    );
  }
}


