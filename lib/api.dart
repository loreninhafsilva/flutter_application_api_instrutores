import 'package:flutter/material.dart';
import 'package:flutter_application_api_instrutores/instrutor.dart';
import 'package:flutter_application_api_instrutores/instrutorRepository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyTeste extends StatefulWidget {
  const MyTeste({super.key});

  @override
  State<MyTeste> createState() => _MyTesteState();
}

class _MyTesteState extends State<MyTeste> {

  int codigo = 0;
  String nome = "";
  int alunos = 0;
  String especialidade = "";

  Instrutor instrutorAcesso = Instrutor();
  InstrutorRepository instrutorRepo = InstrutorRepository();

  Future<void> obterTodosInstrutores() async{

    var url = Uri.parse('http://192.168.0.105:8080/apiInstrutor/instrutores');
    http.Response response = await http.get(url);
    print("ok2");

    if(response.statusCode == 200){
      //Successful API call
      final data = response.body;
      List lista = jsonDecode(data) as List;
      instrutorRepo.listaInstrutores = lista.map((lista) => Instrutor.fromJson(lista)).toList();
      for(var element in instrutorRepo.listaInstrutores){
        print(element.nome);
      }
      setState(() {
        
      });
    } else{
      //API call failed
      print('Request failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Center(child: Column (children: [
        ElevatedButton (onPressed: () => obterTodosInstrutores(),
        child: Text("Buscar Instrutor Específico")),
        SizedBox (height: 50),
        Expanded (child:
          ListView.separated ( itemBuilder: (context, index) {
              return ListTile(
                leading: Text (instrutorRepo.listaInstrutores [index].codigo.toString()),
                title: Text(instrutorRepo.listaInstrutores [index].nome),
                subtitle: Text (instrutorRepo.listaInstrutores [index].alunos.toString()),
                trailing: Text(instrutorRepo.listaInstrutores [index].especialidade), 
              );
            },
            shrinkWrap: true,
            separatorBuilder: (contex, index) => Divider (thickness: 2,),
            itemCount: instrutorRepo.listaInstrutores.length,
            padding: EdgeInsets.all(7),
)
), 
]),
) 
); 
}
}