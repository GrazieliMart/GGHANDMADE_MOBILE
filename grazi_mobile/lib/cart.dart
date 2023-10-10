import 'package:flutter/material.dart';
import 'NavBar.dart';


class Carrinho extends StatefulWidget {
  const Carrinho({super.key});

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: (Text('Carrinho')),
      backgroundColor: Color.fromARGB(181, 177, 42, 255),
      actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: Icon(Icons.house),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/conta');
              },
              icon: Icon(Icons.person),
            ),
          ],
        
      ),
      body:
  
       Column(children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
            ],

          ),

      ]),
    );
      
  }
}