

class Produto {
  int _codigo = 0;

  String _nome = "";
  String _tipo = "";
  int _quantidade = 0;
  int _preco = 0;

  Produto(this._codigo, this._nome);

 int get codigo => this._codigo;

 set codigo(int value) => this._codigo = value;
  get nome => this._nome;

  set nome(value) => this._nome = value;

  get tipo => this._tipo;

  set tipo(value) => this._tipo = value;

  get quantidade => this._quantidade;

  set quantidade(value) => this._quantidade = value;

  get preco => this._preco;

  set preco(value) => this._preco = value;
}
