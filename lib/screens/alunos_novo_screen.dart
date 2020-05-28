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
        backgroundColor: Colors.grey[300],
        title: Text("Nova chamada", style: new TextStyle(fontSize: 20.0, color: Colors.black)),
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
                      hintText: 'Digite o nome da aula',
                      labelText: 'Nome da aula',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite o nome da aula';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      alunoModel.nome = value;
                    },
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      icon: const Icon(Icons.date_range),
                      hintText: 'Digite a data',
                      labelText: 'Data',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite a data';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      alunoModel.sobrenome = value;
                    },
                  ),
                  DropdownButtonFormField<String>(
                    value: alunoModel.turma,
                    items:
                        ["Presente", "Faltou"]
                            .map((label) => DropdownMenuItem(
                                  child: Text(label),
                                  value: label,
                                ))
                            .toList(),
                    decoration: new InputDecoration(
                      alignLabelWithHint: true,
                      icon: const Icon(Icons.assignment_ind),
                      hintText: 'Presente?',
                      labelText: 'Aluno 1 Presente?',
                    ),
                    validator: (value) {
                      if ((value == null)) {
                        return 'Selecione a presença';
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
                  ),
                 DropdownButtonFormField<String>(
                    value: alunoModel.presenca,
                    items:
                        ["Presente", "Faltou"]
                            .map((label) => DropdownMenuItem(
                                  child: Text(label),
                                  value: label,
                                ))
                            .toList(),
                    decoration: new InputDecoration(
                      alignLabelWithHint: true,
                      icon: const Icon(Icons.assignment_ind),
                      hintText: 'Presente?',
                      labelText: 'Aluno 2 Presente?',
                    ),
                    validator: (value) {
                      if ((value == null)) {
                        return 'Selecione a presença';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      alunoModel.presenca = value;
                    },
                    onChanged: (value) {
                      setState(() {
                        alunoModel.presenca = value;
                      });
                    },
                  ),
  
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
