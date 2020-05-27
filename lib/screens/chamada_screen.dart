import 'package:fiap/models/aluno_model.dart';
import 'package:fiap/repository/aluno_repository.dart';
import 'package:flutter/material.dart';

class ChamadaScreen extends StatefulWidget {
  @override
  _ChamadaScreenState createState() => _ChamadaScreenState();
}

class _ChamadaScreenState extends State<ChamadaScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  AlunoRepository alunoRepository = AlunoRepository();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        title: Text("Alunos"),
      ),
      body: FutureBuilder<List>(
        future: alunoRepository.findAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.length > 0) {
              return buildListView(snapshot.data);
            } else {
              return Center(child: Text("Nenhum aluno cadastrado! Adicione pelo menos 1 aluno"),);
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        child: Icon(Icons.add),
        onPressed: () async {
          var retorno = await Navigator.pushNamed(context, "/novo");

          if (retorno != null) {
            setState(() {});

            scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text(retorno),
              ),
            );
          }
        },
      ),
    );
  }

  ListView buildListView(List<AlunoModel> alunos) {
    return ListView.builder(
      itemCount: alunos == null ? 0 : alunos.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Dismissible(
          key: Key(alunos[index].id.toString()),
          child: cardAluno(alunos[index]),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            print(direction);
            alunoRepository.deleteRaw(alunos[index]);
            setState(() { });
          },
          background: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.redAccent,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Card cardAluno(AlunoModel alunos) {
    return Card(
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 75, 96, .9),
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          
          title: Text(
            alunos.nome,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: () async {
            await Navigator.pushNamed(
              context,
              "/alunos_detalhes",
              arguments: alunos,
            );

            setState(() {});
          },
        ),
      ),
    );
  }
}