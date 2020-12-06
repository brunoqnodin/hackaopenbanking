import 'package:flutter/material.dart';
import 'package:openbanking/Pages/ui/clipper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Contas1 extends StatefulWidget {
  @override
  _Contas1State createState() => _Contas1State();
}

class _Contas1State extends State<Contas1> {

  var _listabanco = [
    "Banco do Brasil",
    "Bradesco",
    "Caixa",
    "Safra",
    "Santander",
  ];

  var _empresa_formalizada;
  bool _contrato = false;
  bool _contratonovo;
  String _valorbanco;
  String _banco;
  String _agencia;
  String _conta;
  String _senha;
  String _idUsuarioLogado;
  String _nomeUsuarioLogado;
  TextEditingController _controllerBanco = TextEditingController();
  TextEditingController _controllerAgencia = TextEditingController();
  TextEditingController _controllerConta = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  _recuperarDadosUsuario()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User usuarioLogado = await auth.currentUser;
    _idUsuarioLogado = usuarioLogado.uid;

    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot snapshot = await db.collection("usuarios").doc(_idUsuarioLogado).get();

    Map<String, dynamic> dados = snapshot.data();
  }

  _inserir()async{
    _banco = _controllerBanco.text;
    _agencia = _controllerAgencia.text;
    _conta = _controllerConta.text;
    _senha = _controllerSenha.text;
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentReference reference = await db.collection("banco").add(
        {
          "banco": "${_valorbanco}",
          "agencia": "${_agencia}",
          "conta": "${_conta}",
          "senha": "${_senha}",
          "timestamp": DateTime.now(),
          "uidUsuario": _idUsuarioLogado
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/logoopenminer2.png", height: 40,),
        centerTitle: true,
        backgroundColor: Color(0xFF2A5C5B),
        elevation: 0,
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
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 100, bottom: 10),
                    child: Text(
                      "Sincronizar dados bancários",
                      style: TextStyle(fontSize: 19, color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                    child: DropdownButtonFormField(
                      items: _listabanco.map((String category) {
                        return new DropdownMenuItem(
                          value: category,
                          child: Text(category, style: TextStyle(color: Colors.grey, fontSize: 23),),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        // do other stuff with _category
                        setState(() => _valorbanco = newValue);
                      },
                      value: _valorbanco,
                      hint: Text("Banco", style: TextStyle(color: Colors.white38, fontSize: 23),),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.account_balance,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: "Banco",
                        labelStyle:
                        TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                    child: TextFormField(
                      controller: _controllerAgencia,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.account_balance,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: "Agência bancária",
                        labelStyle:
                        TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                    child: TextFormField(
                      controller: _controllerConta,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.account_box,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: "Conta corrente com dígito",
                        labelStyle:
                        TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                    child: TextFormField(
                      controller: _controllerSenha,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: "Senha do internet banking",
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelStyle:
                        TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 30, bottom: 30, right: 10),
                    child: Text(
                      "Conexão com a conta bancária em modo de visualização e em nível de segurança bancária.",
                      style: TextStyle(fontSize: 18, color: Colors.blue), textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: CheckboxListTile(
                      title: Text(
                          "Autorizo OpenMiner a acessar os dados financeiros da minha empresa apenas em modo de visualização."),
                      value: _contrato,
                      onChanged: (_contratonovo) {
                        setState(() {
                          _contrato = _contratonovo;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFF22B995),
                    ),
                    child: SizedBox.expand(
                      child: FlatButton(
                        onPressed: () {
                          _inserir();
                          return showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) {
                                return AlertDialog(
                                  title:
                                  Text("Dados Cadastrados com Sucesso!"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Text(
                          "Sincronizar conta",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
