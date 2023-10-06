import 'produto.dart';

class ProdutoRepo {
  static List<Produto> _listaProdutos = [];
  static get getListaProdutos => _listaProdutos;
  set listaProdutos(value) => _listaProdutos = value;

  //adicionar Aluno à lista
  void adicionar(Produto produto) {
    _listaProdutos.add(produto);
  }

  static void remover(Produto produto) {
    _listaProdutos.remove(produto);
  }


}
