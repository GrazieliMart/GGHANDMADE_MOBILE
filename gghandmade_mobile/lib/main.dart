import 'package:flutter/material.dart';
import 'home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'GGHANDMADE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 154, 91, 255))
      ),
      home: MaterialApp(
        
        initialRoute: '/',
      routes: {
        '/':(context) => Myhome(),

      },
  
      ),);
    
    }}