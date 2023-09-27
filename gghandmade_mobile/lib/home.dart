import 'package:flutter/material.dart';
import 'NavBar.dart';
class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _HomeState();
}

class _HomeState extends State<Myhome> 
{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        
        title: (Text("GGHANDMADE")),
        backgroundColor: Color.fromARGB(181, 177, 42, 255),

      ),
      body: Center(),

    );



  }
}