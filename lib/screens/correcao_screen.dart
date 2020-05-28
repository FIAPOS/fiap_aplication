import 'package:fiap/models/trabalho_model.dart';
import 'package:fiap/repository/trabalhos_repository.dart';
import 'package:flutter/material.dart';

class CorrecaoScreen extends StatefulWidget {
  @override
  _CorrecaoScreenState createState() => _CorrecaoScreenState();
}

class _CorrecaoScreenState extends State<CorrecaoScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TrabalhoModel trabalhoModel;

  Widget build(BuildContext context) {
    trabalhoModel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        title: Text("Correção"),
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
                    initialValue: trabalhoModel.nota,
                    decoration: new InputDecoration(
                      icon: const Icon(Icons.text_fields),
                      hintText: 'Digite um comentario',
                      labelText: 'Comentario',
                    ),
                    onSaved: (value) {
                      trabalhoModel.comentario = value;
                    },
                  ),
                  TextFormField(
                    initialValue: trabalhoModel.comentario,
                    decoration: new InputDecoration(
                      icon: const Icon(Icons.monetization_on),
                      hintText: 'Digite a nota',
                      labelText: 'Nota',
                    ),
                    onSaved: (value) {
                      trabalhoModel.nota = value;
                    },
                    keyboardType: TextInputType.number,
                  ),
                  

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RaisedButton(
                      child: Text("Gravar"),
                      onPressed: () {

                        
                          formKey.currentState.save();

                          TrabalhosRepository().updateRaw(trabalhoModel);

                          Navigator.pop(
                            context,
                            trabalhoModel,
                          );
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