import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:openbanking/Pages/Ajuda.dart';
import 'package:openbanking/Pages/Cadastro.dart';
import 'package:openbanking/Pages/Mapa.dart';
import 'package:openbanking/Pages/Solicita.dart';
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
  List<String> itensMenu = ["Ver Perfil", "Sair"];

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
      case "Ver Perfil":
        Navigator.pushNamed(context, "/perfil");
        break;
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
      Ajuda(),
      Cadastro(),
      Mapa(),
      Solicita()
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF20232D)),
        title: Text("OpenBanking"),
        backgroundColor: Colors.blueGrey,
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
      body: Container(
        width: double.infinity,
        child: paginas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
              label: "Cadastro",
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: "Postos",
              icon: Icon(Icons.map)
          ),
          BottomNavigationBarItem(
              label: "Solicitações",
              icon: Icon(Icons.reorder)
          ),
          BottomNavigationBarItem(
             label: "Ajuda",
              icon: Icon(Icons.help)
          ),
        ],
      ),
      drawer: OpenBankingDrawer(),
    );
  }
}
