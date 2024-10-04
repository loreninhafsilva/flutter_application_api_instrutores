import 'package:flutter_application_api_instrutores/instrutor.dart';

class InstrutorRepository {
  List<Instrutor> _listaInstrutores = [];
  
  InstrutorRepository();

  List<Instrutor> get listaInstrutores => this._listaInstrutores;

  set listaInstrutores(List<Instrutor> value) => this._listaInstrutores = value;
}