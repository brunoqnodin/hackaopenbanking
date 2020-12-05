import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';


class OpenBankingDrawer extends StatefulWidget {
  @override
  _OpenBankingDrawerState createState() => _OpenBankingDrawerState();
}

class _OpenBankingDrawerState extends State<OpenBankingDrawer> {


  String _idUsuarioLogado;
  String _urlImagemRecuperada;
  List<String> itensMenu = ["Perfil", "Sair"];
  _recuperarDadosUsuario()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User usuarioLogado = await auth.currentUser;
    _idUsuarioLogado = usuarioLogado.uid;

    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot snapshot = await db.collection("usuarios").doc(_idUsuarioLogado).get();

  }

  @override
  void initState(){
    super.initState();
    _recuperarDadosUsuario();
  }
  Widget build(BuildContext context) {
    return ClipPath(
      //clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              child: DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "/perfil");
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        backgroundImage: _urlImagemRecuperada != null ? NetworkImage("${_urlImagemRecuperada}") : null,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset("images/logochapada.png"),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFEE7700),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: FlatButton.icon(
                textColor: Color(0xFFEE7700),
                onPressed: (){},
                icon: Icon(Icons.home),
                label: Text("      Enviar Solicitação"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:  Divider(
                color: Color(0xFFEE7700),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: FlatButton.icon(
                textColor: Color(0xFFEE7700),
                onPressed: (){},
                icon: Icon(Icons.map),
                label: Text("      Postos Autorizados"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:  Divider(
                color: Color(0xFFEE7700),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: FlatButton.icon(
                textColor: Color(0xFFEE7700),
                onPressed: (){},
                icon: Icon(Icons.insert_chart),
                label: Text("      Acompanhar Solicitações"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:  Divider(
                color: Color(0xFFEE7700),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: FlatButton.icon(
                textColor: Color(0xFFEE7700),
                onPressed: (){},
                icon: Icon(Icons.help),
                label: Text("      Ajuda"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:  Divider(
                color: Color(0xFFEE7700),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: FlatButton.icon(
                textColor: Color(0xFFEE7700),
                onPressed: (){},
                icon: Icon(Icons.exit_to_app),
                label: Text("      Sair"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}