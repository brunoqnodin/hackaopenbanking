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

  _logoffUsuario()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    Navigator.pushReplacementNamed(context, "/login");
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
                    Image.asset("assets/logoopenminer.png"),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFF8F9FA),
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
                textColor: Colors.white70,
                onPressed: (){},
                icon: Icon(Icons.insert_drive_file),
                label: Text("      Propostas"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:  Divider(
                color: Colors.white70,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: FlatButton.icon(
                textColor: Colors.white70,
                onPressed: (){},
                icon: Icon(Icons.home),
                label: Text("      Minha Empresa"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:  Divider(
                color: Colors.white70,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: FlatButton.icon(
                textColor: Colors.white70,
                onPressed: (){},
                icon: Icon(Icons.insert_chart),
                label: Text("      Extratos Unificados"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:  Divider(
                color: Colors.white70,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: FlatButton.icon(
                textColor: Colors.white70,
                onPressed: (){},
                icon: Icon(Icons.account_circle),
                label: Text("      Meus Dados"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:  Divider(
                color: Colors.white70,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: FlatButton.icon(
                textColor: Colors.white70,
                onPressed: (){
                  _logoffUsuario();
                },
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