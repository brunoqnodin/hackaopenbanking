import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:openbanking/Contas.dart';
import 'package:openbanking/Pages/Cadastro.dart';
import 'package:openbanking/Pages/Extratos.dart';
import 'package:openbanking/Pages/Propostas.dart';
import 'package:openbanking/Pages/Solicita.dart';
import 'package:openbanking/Pages/ui/clipper.dart';
import 'package:openbanking/Pages/ui/draweropen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _emailUsuario = "";
  int _indiceAtual = 0;
  String _idUsuarioLogado;
  String _urlImagemRecuperada;
  List<String> itensMenu = ["Sair"];

  _recuperarDadosUsuario()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User usuarioLogado = await auth.currentUser;
    _idUsuarioLogado = usuarioLogado.uid;

    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot snapshot = await db.collection("usuarios").doc(_idUsuarioLogado).get();

    setState(() {
      _emailUsuario = usuarioLogado.email;
    });
  }

  _escolhaMenuItem(String itemEscolhido){
    switch (itemEscolhido){
      case "Sair":
        _logoffUsuario();
        break;
    }
  }
  _logoffUsuario()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    Navigator.pushReplacementNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> paginas = [
      Propostas(),
      Solicita(),
      Extratos(),
      Contas()
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white70),
        elevation: 0,
        title: Image.asset("assets/logoopenminer2.png", height: 40,),
        backgroundColor: Color(0xFF2A5C5B),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _escolhaMenuItem,
            itemBuilder: (context){
              return itensMenu.map((String item){
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF2A5C5B),
                ),
                height: 60,
              ),
            ),
            Container(
              width: double.infinity,
              child: paginas[_indiceAtual],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF2A5C5B),
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
              label: "Propostas",
              icon: Icon(Icons.insert_drive_file)
          ),
          BottomNavigationBarItem(
              label: "Contas",
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: "Extratos",
              icon: Icon(Icons.insert_chart)
          ),
          BottomNavigationBarItem(
             label: "Cadastrar conta",
              icon: Icon(Icons.account_circle)
          ),
        ],
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Color(0xFF2A5C5B)),
        child: OpenBankingDrawer(),
      ),
    );
  }
}
