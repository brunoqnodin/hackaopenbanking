import 'package:flutter/material.dart';
import 'package:curl/curl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart';

class Extratos extends StatefulWidget {
  @override
  _ExtratosState createState() => _ExtratosState();
}

class _ExtratosState extends State<Extratos> {
  String _idUsuarioLogado;
  String _request;
  _recuperarDadosUsuario()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User usuarioLogado = await auth.currentUser;
    _idUsuarioLogado = usuarioLogado.uid;

    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot snapshot = await db.collection("usuarios").doc(_idUsuarioLogado).get();

    Map<String, dynamic> dados = snapshot.data();

  }

  void _apibanficorequest()async{
    final _req1="curl_setopt_array"+("GET"+"https://auth.obiebank.banfico.com/auth/realms/provider/protocol/openid-connect/token")+"CURLOPT_RETURNTRANSFER => true"+"CURLOPT_ENCODING => ''"+"CURLOPT_MAXREDIRS => 10";
    final req6="CURLOPT_TIMEOUT => 0";
    final req7="CURLOPT_FOLLOWLOCATION => true";
    final req8="CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1";
    final req9="CURLOPT_CUSTOMREQUEST => 'POST'";
    final req10="CURLOPT_POSTFIELDS => 'grant_type=client_credentials&scope=accounts'";
    final req11="CURLOPT_HTTPHEADER => array(Authorization: Basic UFNEQlItTkNBLUFJU1AwMjp0ZXN0ZTAx"+"Content-Type: application/x-www-form-urlencoded"+"Cookie: af5c7d4267a21108bcdce09dce18934d=6e34fd468132c5aa95951e14839217fa";
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
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60, bottom: 20),
            child: Text("Extratos", style: TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold),),
          ),
          Card(
            elevation: 5,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 20),
                  child: Text("2017-04-05T10:43:07Z", style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("Tipo de Transação: "+ "Debit"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("Local: "+ "Towbar Club 3 - We Love Towbars"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("Valor: "+ "0.57 GBP"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            elevation: 5,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 20),
                  child: Text("2017-05-06T09:00:00Z", style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("Tipo de Transação: "+ "Debit"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("Local: "+ "Golf Club"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("Valor: "+ "22.30 GBP"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
