class Instrutor {
  int _codigo = 0;
  String _nome = "";
  int _alunos = 0;
  String _especialidade = "";

  int get codigo => this._codigo;

  set codigo(int value) => this._codigo = value;

  int get alunos => this._alunos;

  set alunos(int value) => this._alunos = value;

  String get nome => this._nome;

  set nome(String value) => this._nome = value;

  String get especialidade => this._especialidade;

  set especialidade(String value) => this.especialidade = value;

  Instrutor();

  Instrutor.fromJson(Map<String, dynamic> json)
  :
    _codigo = json['codigo'],
    _nome = json['nome'],
    _alunos = json['alunos'],
    _especialidade = json['especialidade']
  ;

  
}