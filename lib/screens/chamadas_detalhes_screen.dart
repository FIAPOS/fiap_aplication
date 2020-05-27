import 'package:fiap/models/aluno_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChamadaDetalhesScreen extends StatefulWidget {
  @override
  _ChamadaDetalhesScreenState createState() => _ChamadaDetalhesScreenState();
}

class _ChamadaDetalhesScreenState extends State<ChamadaDetalhesScreen> {
  
    AlunoModel alunoModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();


  Widget build(BuildContext context) {
    alunoModel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(alunoModel.nome, style: TextStyle(fontSize: 20.0, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            labelValue('ID'),
            fieldValue(alunoModel.id.toString()),
            espaco(),
            labelValue('Nome da aula'),
            fieldValue(alunoModel.nome),
            espaco(),
            labelValue('Data'),
            fieldValue(alunoModel.sobrenome),
            espaco(),
            labelValue('Aluno 1'),
            fieldValue(alunoModel.turma),
            espaco(),
            labelValue('Aluno 2'),
            fieldValue(alunoModel.presenca),
            espaco(),
            
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