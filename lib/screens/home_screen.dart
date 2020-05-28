import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              "Opções",
              style: new TextStyle(fontSize: 30.0, color: Colors.grey),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 400,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(left: 15.0, right: 5.0),
                ),
                GestureDetector(
                  child: new Image.asset('web.png'),
                  onTap: () async {
                    await launch('https://www2.fiap.com.br/');
                  },
                ),
                
                new Padding(
                  padding: new EdgeInsets.only(left: 5.0, right: 5.0),
                ),
                GestureDetector(
                  child: new Image.asset('correcao.png'),
                  onTap: () async {
                    Navigator.pushNamed(context, "/trabalhos");
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(left: 5.0, right: 5.0),
                ),
                GestureDetector(
                  child: new Image.asset('chamada.png'),
                  onTap: () async {
                    Navigator.pushNamed(context, "/turma");
                  },
                ),
              ],
            ),
          ),
          new Padding(
            padding: new EdgeInsets.only(
                left: 30.0, right: 30.0, top: 10.0, bottom: 15.0),
            child: new Text(
              "Fique por dentro",
              style: new TextStyle(fontSize: 30.0, color: Colors.grey),
            ),
          ),
          new Image.asset(
            'pordentro.png',
            height: 200,
          ),
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
            'unnamed.png',),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
              ),
              //CATEGORIAS
              ListTile(
                title: Text('Fazer chamada',style: TextStyle(color: Colors.grey[800])),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/turma",
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
                    "/trabalhos",
                  );
                },
              ),
            ],
          ),
        ));
  }
  
}
