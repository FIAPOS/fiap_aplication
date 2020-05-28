import 'package:fiap/models/trabalho_model.dart';
import 'package:fiap/repository/trabalhos_repository.dart';
import 'package:flutter/material.dart';

class TrabalhosScreen extends StatefulWidget {
  @override
  _TrabalhosScreenState createState() => _TrabalhosScreenState();
}

class _TrabalhosScreenState extends State<TrabalhosScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TrabalhosRepository trabalhoRepository = TrabalhosRepository();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.grey[400]),
          title: Text(
              "Correção",
              style: new TextStyle(fontSize: 20.0, color: Colors.grey),
            ),
          backgroundColor: Colors.grey[200],
        ),
      body: FutureBuilder<List>(
        future: trabalhoRepository.findAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.length > 0) {
              return buildListView(snapshot.data);
            } else {
              return Center(child: Text("Nenhum trabalho cadastrado!"),);
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[500],
        child: Icon(Icons.add),
        onPressed: () async {
          var retorno = await Navigator.pushNamed(context, "/novoTrab");

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

  ListView buildListView(List<TrabalhoModel> trabalho) {
    return ListView.builder(
      itemCount: trabalho == null ? 0 : trabalho.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Dismissible(
          key: Key(trabalho[index].id.toString()),
          child: cardTrabalho(trabalho[index]),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            print(direction);
            trabalhoRepository.deleteRaw(trabalho[index]);
            setState(() { });
          },
          background: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.pink[500],
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

  Card cardTrabalho(TrabalhoModel trabalho) {
    return Card(
      clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          
          title: Text(
            trabalho.nome,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Text(
                    trabalho.integrantes,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black,
            size: 30.0,
          ),
          onTap: () async {
            await Navigator.pushNamed(
              context,
              "/detalhesTrab",
              arguments: trabalho,
            );

            setState(() {});
          },
        ),
      ),
    );
  }
}