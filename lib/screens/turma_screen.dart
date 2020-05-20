import 'package:flutter/material.dart';

class TurmaScreen extends StatefulWidget {
  @override
  _TurmaScreenState createState() => _TurmaScreenState();
}

class _TurmaScreenState extends State<TurmaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.grey[400]),
          title: Image.asset(
            'unnamed.png',
            width: 70,
          ),
          backgroundColor: Colors.grey[200],
        ),
        body: ListView(children: <Widget>[
          new Padding(
            padding: new EdgeInsets.only(
                left: 30.0, right: 30.0, top: 20.0, bottom: 0.0),
            child: new Text(
              "Turmas",
              style: new TextStyle(fontSize: 30.0, color: Colors.grey),
            ),
          ),
          Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 12.0,
              margin: new EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 6.0,
              ),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                  child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: new BoxDecoration(
                          border: new Border(
                            right: new BorderSide(
                              width: 1.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        child: Icon(
                          Icons.group,
                          color: Colors.grey,
                        ),
                      ),
                      title: Text(
                        "3SIA",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                        size: 30.0,
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/chamada",
                        );
                      })))
        ]),
        backgroundColor: Colors.grey[100],
        //DRAWER: DESENHA O MENU DO USUARIO
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              //BANNER DO MENU
              DrawerHeader(
                child: Image.asset(
                  'unnamed.png',
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
              ),
              //CATEGORIAS
              ListTile(
                title: Text('Fazer chamada',
                    style: TextStyle(color: Colors.grey[800])),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/turmas",
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Correção de trabalhos',
                  style: TextStyle(color: Colors.grey[800]),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/correcao",
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Voltar',
                  style: TextStyle(color: Colors.redAccent),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/",
                  );
                },
              ),
            ],
          ),
        ));
  }
}
