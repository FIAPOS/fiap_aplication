import 'package:fiap/models/trabalho_model.dart';
import 'package:fiap/repository/aluno_repository.dart';
import 'package:fiap/repository/trabalhos_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TrabalhoNovoScreen extends StatefulWidget {
  @override
  _TrabalhoNovoScreenState createState() => _TrabalhoNovoScreenState();
}

class _TrabalhoNovoScreenState extends State<TrabalhoNovoScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TrabalhoModel trabalhoModel = new TrabalhoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        title: Text("Novo Trabalho"),
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
                      hintText: 'Digite o nome do trabalho',
                      labelText: 'Nome do trabalho',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite o nome do trabalho';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      trabalhoModel.nome = value;
                    },
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      icon: const Icon(Icons.text_fields),
                      hintText: 'Digite o nome dos integrantes',
                      labelText: 'Integrantes',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite o nome dos integrantes';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      trabalhoModel.integrantes = value;
                    },
                  ),
                  
  
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RaisedButton(
                      child: Text("Gravar"),
                      onPressed: () {

                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          
                          new TrabalhosRepository().createRaw(trabalhoModel);


                          var mensagem = trabalhoModel.nome + ' cadastrado com sucesso!'; 

                          Navigator.pop(
                            context,
                            mensagem,
                          );

                        } else {
                          scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text(
                                'Não foi possível gravar o trabalho.',
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
