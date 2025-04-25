import 'package:flutter/material.dart';
import 'package:flutter_gestion_student/utils/constants.dart';
import 'package:flutter_gestion_student/views/screens/compte/detail/compte_detail.dart';
import 'package:flutter_gestion_student/views/screens/compte/form/compte_form.dart';
import 'package:flutter_gestion_student/views/screens/compte/list/comptes_list.dart';
import 'package:flutter_gestion_student/views/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
      title: AppConstants.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
         initialRoute: '/',
         routes: {
           '/': (context) => HomeScreen(),
           '/comptes': (context) => CompteListScreen(),
           '/add': (context) => CompteFormScreen(),
           '/detail': (context) => CompteDetailScreen(),
       },
     // home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}