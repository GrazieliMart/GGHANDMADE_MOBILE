import 'package:flutter/material.dart';
import 'NavBar.dart';
import 'cart.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _HomeState();
}

class _HomeState extends State<Myhome> {
  String nomeBusca = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(181, 177, 42, 255),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/account');
              },
              icon: Icon(Icons.person),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
              icon: Icon(Icons.badge),
            ),
          ],
          flexibleSpace: Container(
            height: 80.0,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 10.0),
                  width: 350.0, 
                  child: Center(
                    child: TextField(
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: 'Pesquisar Produtos',
                        prefixIcon: Icon(Icons.search, color: Colors.white), // Ícone de lupa
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hoverColor: Color.fromARGB(82, 255, 255, 255),
                        filled: true,
                        fillColor: Color.fromARGB(0, 0, 0, 0),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        labelStyle: TextStyle(color: Colors.white), // Define a cor do texto do rótulo
                      ),
                      onChanged: (String nome) {
                        setState(() {
                          //nomeBusca = nome;
                          //atualizaLista(nomeBusca);
                        });
                      },
                      onSubmitted: (String nome) {
                        setState(() {
                          // Ação ao enviar
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
            ],
          ),
        ],
      ),
        
      
    );
  }
}
