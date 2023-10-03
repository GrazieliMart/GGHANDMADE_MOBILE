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
  final campoCod = TextEditingController();
  final campoNome = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  ProdutoRepo produtoRepo = new ProdutoRepo();

  final FocusNode focoCPF = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Form(
                key: this._formKey,
                child: Column(children: [
                  TextFormField(
                    controller: campoCod,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    focusNode: focoCPF,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      labelText: 'Código',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Color.fromARGB(255, 184, 206, 225),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'O código não pode ser vazio';
                      } else {
                        if (int.parse(campoCod.text) < 10) {
                          return 'O código deve ser maior que 10';
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: campoNome,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Color.fromARGB(255, 184, 206, 225),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'O nome não pode ser vazio';
                      } else {
                        if (campoNome.text.length < 5) {
                          return 'O nome deve ter pelo menos 5 caracteres';
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
                          int cod = int.parse(campoCod.text);
                          String nome = campoNome.text;
                          Produto p = new Produto(cod, nome);
                          produtoRepo.adicionar(p);
                          produtoRepo.imprimir();
                          limparCampos();
                          mostrarMsgSucesso();
                          setState(() {});
                        }
                      },
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(fontSize: 15),
                      )),
                  SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        limparCampos();
                        _formKey.currentState!.reset();
                        setState(() {});
                      },
                      child: Text(
                        'Limpar',
                        style: TextStyle(fontSize: 15),
                      )),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ));
  }

  void limparCampos() {
    campoCod.clear();
    campoNome.clear();
    focoCPF.requestFocus();
  }

  void mostrarMsgSucesso() {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Produto cadastrado com sucesso')));
  }
}
