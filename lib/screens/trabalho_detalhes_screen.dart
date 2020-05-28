import 'package:fiap/models/trabalho_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrabalhoDetalhesScreen extends StatefulWidget {
  @override
  _TrabalhoDetalhesScreenState createState() => _TrabalhoDetalhesScreenState();
}

class _TrabalhoDetalhesScreenState extends State<TrabalhoDetalhesScreen> {
  
    TrabalhoModel trabalhoModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();


  Widget build(BuildContext context) {
    trabalhoModel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(trabalhoModel.nome, style: TextStyle(fontSize: 20.0, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            labelValue('ID'),
            fieldValue(trabalhoModel.id.toString()),
            espaco(),
            labelValue('Nome do trabalho'),
            fieldValue(trabalhoModel.nome),
            espaco(),
            labelValue('Nota'),
            fieldValue(trabalhoModel.nota),
            espaco(),
            labelValue('Integrantes'),
            fieldValue(trabalhoModel.integrantes),
            espaco(),
            labelValue('Comentários'),
            fieldValue(trabalhoModel.comentario),
            espaco(),
            Center(
              child: RaisedButton(
                color: Color.fromRGBO(64, 75, 96, .9),
                textColor: Colors.white,
                child: Text("Corrigir"),
                onPressed: () async {
                  var retorno = await Navigator.pushNamed(
                    context,
                    "/correcao",
                    arguments: trabalhoModel,
                  );

                  if (retorno != null) {

                    trabalhoModel = retorno as TrabalhoModel;

                    setState(() { });

                    scaffoldKey.currentState.showSnackBar(
                      new SnackBar(
                        content: Text(
                          'Corrigido com sucesso!',
                        ),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.pink[500],
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  SizedBox espaco() => SizedBox(
        height: 16,
      );

  Widget labelValue(String _label) {
    return Text(
      '$_label:',
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Color.fromRGBO(64, 75, 96, 1),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),
    );
  }

  Widget fieldValue(String _value) {
    return Text(
      _value,
      style: TextStyle(
        color: Color.fromRGBO(64, 75, 96, .9),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w800,
        fontSize: 20,
      ),
    );
  }
}