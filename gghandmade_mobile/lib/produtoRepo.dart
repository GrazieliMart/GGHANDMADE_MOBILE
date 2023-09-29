import 'produto.dart';

class ProdutoRepo{
  static List<Produto> _listaProdutos = [];
  static get getListaProdutos => _listaProdutos;
  set listaProdutos(value)=> _listaProdutos = value;

  
}