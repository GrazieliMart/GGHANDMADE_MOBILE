import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gghandmade_mobile/produto.dart';
import 'package:gghandmade_mobile/produtoRepo.dart';

class AlteraProduto extends StatefulWidget {
  Produto produto;
  int indice;

  AlteraProduto(this.produto, this.indice, {super.key});

  @override
  State<AlteraProduto> createState() => _AlteraProdutoState();
}

class _AlteraProdutoState extends State<AlteraProduto> {

final campoNome = TextEditingController();
  final campoTipo = TextEditingController();
  final campoQuantidade = TextEditingController();
  final campoPreco = TextEditingController();

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  List lista = ProdutoRepo.getListaProdutos;

  ProdutoRepo produtoRepo = new ProdutoRepo();


  @override
  Widget build(BuildContext context) {
    inicializa();
    return Scaffold(
        appBar: AppBar(
          title: Text("Alterar"),
           backgroundColor: Color.fromARGB(181, 177, 42, 255),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Form(
                key: this._formKey,
                child: Column(children: [
                   TextFormField(
                    controller: campoNome,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(
                        
                          borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color.fromARGB(134, 174, 87, 255)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 174, 87, 255)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hoverColor: Color.fromARGB(82, 211, 144, 255),
                        filled: true,
                        fillColor: Color.fromARGB(0, 0, 0, 0),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        labelStyle: TextStyle(color: const Color.fromARGB(255, 54, 54, 54)), // Define a cor do texto do rótulo
                      ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name are Required';
                      } else {
                        if (campoNome.text.length < 5) {
                          return 'Name need have more than 5 caracters';
                        }
                      }
                      return null;
                    },
                  ),
                    SizedBox(height: 30),
                  TextFormField(
                    controller: campoTipo,
                    keyboardType: TextInputType.text,
                    
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      labelText: 'Tipo',
                       border: OutlineInputBorder(
                        
                          borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color.fromARGB(134, 174, 87, 255)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 174, 87, 255)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hoverColor: Color.fromARGB(82, 211, 144, 255),
                        filled: true,
                        fillColor: Color.fromARGB(0, 0, 0, 0),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        labelStyle: TextStyle(color: const Color.fromARGB(255, 54, 54, 54)), // Define a cor do texto do rótulo
                      ),
                    
                   
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Type are required';
                      } else {
                        if ((campoTipo.text.length) < 10) {
                          return 'Type need have more than 10 caracters';
                        }
                      }
                      return null;
                    },
                  ),
                
                 
                  SizedBox(height: 30),
                   TextFormField(
                    controller: campoQuantidade,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      labelText: 'Quantidade',
                      border: OutlineInputBorder(
                        
                          borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color.fromARGB(134, 174, 87, 255)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 174, 87, 255)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hoverColor: Color.fromARGB(82, 211, 144, 255),
                        filled: true,
                        fillColor: Color.fromARGB(0, 0, 0, 0),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        labelStyle: TextStyle(color: const Color.fromARGB(255, 54, 54, 54)), // Define a cor do texto do rótulo
                      ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Quantity are Required';
                      } else {
                        if (campoQuantidade.text.length < 5) {
                          return 'Quantity need have more than 5 caracters';
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                   TextFormField(
                    controller: campoPreco,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      labelText: 'Preço',
                      border: OutlineInputBorder(
                        
                          borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color.fromARGB(134, 174, 87, 255)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 174, 87, 255)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hoverColor: Color.fromARGB(82, 211, 144, 255),
                        filled: true,
                        fillColor: Color.fromARGB(0, 0, 0, 0),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        labelStyle: TextStyle(color: const Color.fromARGB(255, 54, 54, 54)), // Define a cor do texto do rótulo
                      ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Priece are Required';
                      } else {
                        if (campoPreco.text.length < 5) {
                          return 'Price need have more than 5 caracters';
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                ]),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                        
                          String nome = campoNome.text;
                          String tipo = campoTipo.text;
                            int quantidade = int.parse(campoQuantidade.text);
                              int preco = int.parse(campoPreco.text);
                              
                          Produto a = new Produto(nome, tipo, quantidade, preco);
                         
                          lista[widget.indice] = a;
                          print(widget.indice);
                          mostrarMsgSucesso();
                        }
                      },
                      child: Text(
                        'Alterar',
                        style: TextStyle(fontSize: 15)
                        ,
                      )),
                  SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Text("Alterar"),
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
              SizedBox(height: 30),
            ],
          ),
        ));
  }

  void inicializa() {

    campoNome.text = widget.produto.nome;
    campoTipo.text = widget.produto.tipo;    
    campoQuantidade.text = widget.produto.quantidade.toString();
    campoPreco.text = widget.produto.preco.toString();
  }

  void mostrarMsgSucesso() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Produto alterado com sucesso')));
  }
}
