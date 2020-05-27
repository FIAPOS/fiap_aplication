import 'package:fiap/models/aluno_model.dart';
import 'package:fiap/repository/aluno_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlunosNovoScreen extends StatefulWidget {
  @override
  _AlunosNovoScreenState createState() => _AlunosNovoScreenState();
}

class _AlunosNovoScreenState extends State<AlunosNovoScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  AlunoModel alunoModel = new AlunoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        title: Text("Novo Aluno"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: new InputDecoration(
                      icon: const Icon(Icons.text_fields),
                      hintText: 'Digite o nome do Aluno',
                      labelText: 'Nome',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite o nome do aluno';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      alunoModel.nome = value;
                    },
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      icon: const Icon(Icons.text_fields),
                      hintText: 'Digite o sobrenome do Aluno',
                      labelText: 'SobreNome',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite o sobrenome do aluno';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      alunoModel.sobrenome = value;
                    },
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      icon: const Icon(Icons.text_fields),
                      hintText: 'Digite a turma do Aluno',
                      labelText: 'Turma',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite a turma do aluno';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      alunoModel.turma = value;
                    },
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      icon: const Icon(Icons.text_fields),
                      hintText: 'Presenças',
                      labelText: 'Presenças',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Presenças';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      alunoModel.presenca = value;
                    },
                  ),
                  /*DropdownButtonFormField<String>(
                    value: alunoModel.turma,
                    items:
                        ["3SIA", "3SIB", "3SIC", "3SID"]
                            .map((label) => DropdownMenuItem(
                                  child: Text(label),
                                  value: label,
                                ))
                            .toList(),
                    decoration: new InputDecoration(
                      alignLabelWithHint: true,
                      icon: const Icon(Icons.score),
                      hintText: 'Selecione a turma',
                      labelText: 'Turma',
                    ),
                    validator: (value) {
                      if ((value == null)) {
                        return 'Selecione a Turma';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      alunoModel.turma = value;
                    },
                    onChanged: (value) {
                      setState(() {
                        alunoModel.turma = value;
                      });
                    },
                  ),*/

                  
                  



                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RaisedButton(
                      child: Text("Gravar"),
                      onPressed: () {

                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          
                          new AlunoRepository().createRaw(alunoModel);


                          var mensagem = alunoModel.nome + ' cadastrado com sucesso!'; 

                          Navigator.pop(
                            context,
                            mensagem,
                          );

                        } else {
                          scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text(
                                'Não foi possível gravar o aluno.',
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
