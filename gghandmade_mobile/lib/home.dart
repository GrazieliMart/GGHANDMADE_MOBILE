import 'package:flutter/material.dart';
import 'package:gghandmade_mobile/altera.dart';
import 'package:gghandmade_mobile/produto.dart';
import 'package:gghandmade_mobile/produtoRepo.dart';
import 'NavBar.dart';
import 'cart.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _HomeState();
}

class _HomeState extends State<Myhome> {
  List<Produto> lista = ProdutoRepo.getListaProdutos;

  //faz uma cópia da lista original de alunos que vem de Repository
  List<Produto> listaBusca = [];

  //quando deleta aluno da lista original, precisa manter o nome digitado no campo de busca
  String nomeBusca = "";

  @override
  void initState() {
    //cópia da lista original
    listaBusca = List.from(lista);
    super.initState();
  }

  void atualizaLista(String nome) {
    listaBusca = List.from(lista);
    setState(() {
      //seleciona somente os alunos com nome igual ao da busca e grava na cópia
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
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: Color.fromARGB(181, 177, 42, 255),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cadastro')
                        .then((value) => initState());
                  },
                  icon: Icon(Icons.accessibility_rounded)),
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
                          prefixIcon: Icon(Icons.search,
                              color: Colors.white), // Ícone de lupa
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
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                          labelStyle: TextStyle(
                              color: Colors
                                  .white), // Define a cor do texto do rótulo
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
        body: Column(children: [
          SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
                width: 350,
                height: 30,
                child: TextField(
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 184, 206, 225),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (String nome) {
                    //guarda string do campo de busca caso seja necessário usar na exclusão
                    nomeBusca = nome;
                    atualizaLista(nomeBusca);
                  },
                )),
          ]),
          SizedBox(height: 30),
          Divider(
            thickness: 2,
          ),
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (contex, index) => Divider(
              thickness: 2,
            ),
            itemCount: listaBusca.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: CircleAvatar(
                    child: Text(listaBusca[index].nome[0]),
                  ),
                  title: Text(listaBusca[index].nome),
                  subtitle: Text(listaBusca[index].codigo.toString()),
                  trailing: SizedBox(
                    width: 70,
                    child: Row(children: [
                      Expanded(
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return AlteraProduto(
                                        listaBusca[index], index);
                                  },
                                ));
                              },
                              icon: Icon(Icons.edit))),
                      Expanded(
                          child: IconButton(
                              onPressed: () {
                                Produto p = listaBusca[index];
                                ProdutoRepo.remover(p);
                                //após remover o aluno da lista original, chama método para atualizar a cópia
                                atualizaLista(nomeBusca);
                                setState(() {});
                              },
                              icon: Icon(Icons.delete))),
                    ]),
                  ));
            },
            padding: EdgeInsets.all(7),
          ),
          Divider(
            thickness: 2,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text("Voltar")),
        ]));
  }
}
