import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gghandmade_mobile/produto.dart';
import 'package:gghandmade_mobile/produtoRepo.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final campoNome = TextEditingController();
  final campoTipo = TextEditingController();
  final campoQuantidade = TextEditingController();
  final campoPreco = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
   final FocusNode focoNome = FocusNode();
  ProdutoRepo produtoRepo = new ProdutoRepo();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dev Tols"),
           backgroundColor: Color.fromARGB(181, 177, 42, 255),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
               Form(
                key: this._formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: campoNome,
                      keyboardType: TextInputType.text,
                     
                     focusNode: focoNome,
                     style: TextStyle(fontSize: 15),
                     decoration: InputDecoration (
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
                     validator: (value){
                      if (value!.isEmpty){
                        return 'Name cant be null';
                      } else 
                      {
                        if 
                        (campoNome.text.length<5)
                        {
                        return 'Name need have more than 5 caracters';  
                        }
                      }
                    
                     return null;
                     } ,
                    ),
                    SizedBox(height: 50),
                    
                    TextFormField(
                    controller: campoTipo,
                     keyboardType: TextInputType.text,
                     style: TextStyle(fontSize: 15),
                     decoration: InputDecoration (
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
                     validator: (value){
                      if (value!.isEmpty){
                        return 'Type cant be null';
                      } else 
                      {
                        if (campoTipo.text.length<5)
                        {
                        return 'Type need have more than 5 caracters';  
                        }
                      }
                     
                     return null;
                     } ,

                    ),
                      SizedBox(height: 50),
                
                    TextFormField(
                    controller: campoQuantidade,    
                    keyboardType: TextInputType.number,
                     style: TextStyle(fontSize: 15),
                     decoration: InputDecoration (
                      labelText: 'Quantity',
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
                     validator: (value){
                      if (value!.isEmpty){
                        return 'Quantity cant be null';
                      } else 
                      {
                        if (int.parse(campoQuantidade.text)<5)
                        {
                        return 'Quantity need have more than 5 caracters';  
                        }
                      }
                     
                     return null;
                     } ,

                    ),
                      SizedBox(height: 50),
                    
                    TextFormField(
                    controller: campoPreco,
                    keyboardType: TextInputType.number,
                     style: TextStyle(fontSize: 15),
                     decoration: InputDecoration (
                      labelText: 'Priece',
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
                     validator: (value){
                      if (value!.isEmpty){
                        return 'Priece cant be null';
                      } else 
                      {
                        if (int.parse(campoPreco.text)<3)
                        {
                        return 'Priece need have more than 3 caracthers';  
                        }
                      }
                     
                     return null;
                     } ,

                  ),
                  SizedBox(height: 30),
                ]),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                        ElevatedButton(onPressed: () {
                      if (_formKey.currentState!.validate())
                      {  
                        String nome = campoNome.text;
                        String tipo = campoTipo.text; 
                        int quantidade= int.parse(campoQuantidade.text);
                        int preco = int.parse(campoPreco.text);
                       
                     
                        Produto a = Produto(nome, tipo, quantidade, preco);
                          produtoRepo.adicionar(a);
                          limparCampos();
  _formKey.currentState!.reset();
  mostrarMsgSucesso();
                           setState(() {
                          
                        });
                      }
                    }, 
                    
                   child: Text("Cadastrar"),
             style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            )
          )
         ),
                    
                    ),
                    
                    SizedBox(width: 30,),
                      ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text("Home"),
             style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            )
          )
         ),
          ),
                 /* ElevatedButton(
                      onPressed: () {
                        limparCampos();
                        _formKey.currentState!.reset();
                        setState(() {});
                      },
                      child: Text("Limpar campos"),
             style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            )
          )
         ),),*/
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ));
  }

  void limparCampos() {
    
    campoNome.clear();
    campoTipo.clear();
    campoQuantidade.clear();
    campoPreco.clear();

    
  }

  void mostrarMsgSucesso() {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Produto cadastrado com sucesso')));
  }
}
