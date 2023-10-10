import 'package:flutter/material.dart';
import 'package:gghandmade_mobile/altera.dart';
import 'package:gghandmade_mobile/produto.dart';
import 'package:gghandmade_mobile/produtoRepo.dart';
import 'NavBar.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _HomeState();
}

class _HomeState extends State<Myhome> {
  List<Produto> lista = ProdutoRepo.getListaProdutos;

  List<Produto> listaBusca = [];

  String nomeBusca = "";

  @override
  void initState() {
    listaBusca = List.from(lista);
    super.initState();
  }

  void atualizaLista(String nome) {
    listaBusca = List.from(lista);
    setState(() {
      listaBusca = lista
          .where((element) =>
              (element.nome.toLowerCase().contains(nome.toLowerCase())))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
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
            height: 200.0,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 10.0),
                  width: 200.0,
                  child: Center(
                    child: TextField(
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: 'Pesquisar Produtos',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
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
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onChanged: (String nome) {
                        setState(() {
                          nomeBusca = nome;
                          atualizaLista(nomeBusca);
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
            children:  [
             // Image.network("https://images.unsplash.com/photo-1557682250-33bd709cbe85?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHVycGxlJTIwZ3JhZGllbnR8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
             
            //width: 800,)
          
              ],
          ),
          
         
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => Divider(thickness: 2),
            
            itemCount: listaBusca.length,
            itemBuilder: (BuildContext context, int index) {

        

              return ListTile(
              

                leading: CircleAvatar(child: 

               Image.network('https://extra.globo.com/incoming/3850608-296-41c/w448/breading2.jpg',
                width: double.infinity,
            fit: BoxFit.cover,)                
                ),
                  title: Text(listaBusca[index].nome),

                subtitle: Text(listaBusca[index].preco.toString()),

                trailing: SizedBox(
                  width: 70,
                  child: Row(
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return AlteraProduto(listaBusca[index], index);
                              }),
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            Produto p = listaBusca[index];
                            ProdutoRepo.remover(p);
                            atualizaLista(nomeBusca);
                            setState(() {});
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            padding: EdgeInsets.all(7),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text("home"),
             style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            )
          )
         ),
          ),
        ],
      ),
    );
  }
}
