import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:openbanking/Pages/model/Dados.dart';
import 'package:intl/intl.dart';

class Solicita extends StatefulWidget {
  @override
  _SolicitaState createState() => _SolicitaState();
}

class _SolicitaState extends State<Solicita> {
  String _idUsuarioLogado;
  String _imagemUsuario;
  var formatter = new DateFormat('yyyy-MM-dd');
  _recuperarDadosUsuario()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User usuarioLogado = await auth.currentUser;
    _idUsuarioLogado = usuarioLogado.uid;

    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot snapshot = await db.collection("usuarios").doc(_idUsuarioLogado).get();

    Map<String, dynamic> dados = snapshot.data();

  }

  _recuperarDocumentos()async{

    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await db.collection("banco").get();
    for(DocumentSnapshot snapshot in querySnapshot.docs){
      var doc = snapshot.data;
    }

  }


  deleteData(docId){
    FirebaseFirestore.instance.collection("catalogo").doc(docId).delete();
  }
  @override
  void initState(){
    super.initState();
    _recuperarDadosUsuario();
    _recuperarDocumentos();
  }
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60, bottom: 20),
            child: Text("Contas Cadastradas", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("banco").snapshots(),
            builder: (context, snapshot){
              if(snapshot.hasError) {
                return Center(
                  child: Text("Erro: ${snapshot.error}"),
                );
              }else if(snapshot.data == null){
                return Center(
                  child: Text("Não há dados cadastrados!", style: TextStyle(color: Colors.black),),
                );
              }
              switch (snapshot.connectionState){
                case ConnectionState.waiting:
                  return Text("Carregando", style: TextStyle(color: Colors.grey),);
                default:
                  return ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: snapshot.data.docs.map((DocumentSnapshot document){
                      return Card(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text("Banco: "+
                                  document["banco"],
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 10),
                              child: Text(
                                "Agência: "+document["agencia"],
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: GestureDetector(
                                onTap: (){
                                },
                                child: Text("Conta: "+(document["conta"]), style: TextStyle(fontSize: 17),),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    child: FlatButton(
                                      onPressed: (){},
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: FlatButton(
                                      onPressed: (){
                                        return showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (context){
                                              return AlertDialog(
                                                title: Text("Alerta"),
                                                content: Text("Deseja realmente deletar?"),
                                                actions: <Widget>[
                                                  FlatButton(
                                                    onPressed: (){
                                                      deleteData(document.id);
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("Sim"),
                                                  ),
                                                  FlatButton(
                                                    onPressed: (){
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("Não"),
                                                  ),
                                                ],
                                              );
                                            }
                                        );
                                      },
                                      child: Icon(
                                        Icons.not_interested,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: FlatButton(
                                      onPressed: (){
                                      },
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.deepOrange,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: FlatButton(
                                      onPressed: (){},
                                      child: Icon(
                                        Icons.photo,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}

