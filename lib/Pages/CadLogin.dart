import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:openbanking/Pages/ui/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:openbanking/Pages/ui/clipper.dart';

class CadLogin extends StatefulWidget {
  @override
  _CadLoginState createState() => _CadLoginState();
}

class _CadLoginState extends State<CadLogin> {
  bool _contrato = false;
  bool _contratonovo;

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";

  FocusNode _nodeEmail = FocusNode();
  FocusNode _nodeNome = FocusNode();
  FocusNode _nodeSenha = FocusNode();

  _logoffUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    Navigator.pushReplacementNamed(context, "/login");
  }

  _cadastrarUsuario(Usuario usuario) {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .createUserWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((firebaseUser) {
      FirebaseFirestore db = FirebaseFirestore.instance;
      db.collection("usuarios").doc(firebaseUser.user.uid).set(usuario.toMap());

      _logoffUsuario();
    }).catchError((error) {
      setState(() {
        _mensagemErro = "Erro ao cadastrar usuário";
      });
    });
  }

  _validarCampos() {
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if (nome.isNotEmpty) {
      if (email.isNotEmpty && email.contains("@")) {
        if (senha.isNotEmpty) {
          setState(() {
            _mensagemErro = "";
          });
          Usuario usuario = Usuario();
          usuario.nome = nome;
          usuario.email = email;
          usuario.senha = senha;
          _cadastrarUsuario(usuario);
        } else {
          setState(() {
            _mensagemErro = "Preencha a senha";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Utilize um e-mail válido";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha o Nome";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                height: 150,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 80, left: 32, right: 32, bottom: 32),
              width: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Cadastro",
                            style:
                            TextStyle(fontSize: 20, color: Colors.blueGrey),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextFormField(
                          cursorColor: Colors.deepOrange,
                          controller: _controllerNome,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          focusNode: _nodeNome,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Colors.blue,
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white, width: 0),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            labelText: "Usuário",
                            labelStyle:
                            TextStyle(fontSize: 20, color: Colors.blueGrey),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF2A5C5B),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextFormField(
                          cursorColor: Colors.deepOrange,
                          controller: _controllerEmail,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autofocus: true,
                          focusNode: _nodeEmail,
                          onFieldSubmitted: (term) {
                            FocusScope.of(context).requestFocus(_nodeNome);
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white, width: 0),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            labelText: "E-mail",
                            labelStyle:
                            TextStyle(fontSize: 20, color: Colors.blueGrey),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF2A5C5B),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextFormField(
                          cursorColor: Colors.deepOrange,
                          controller: _controllerSenha,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          focusNode: _nodeSenha,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.blue,
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white, width: 0),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            labelText: "Senha",
                            labelStyle:
                            TextStyle(fontSize: 20, color: Colors.blueGrey),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF2A5C5B),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: CheckboxListTile(
                          title: Text(
                              "Ao clicar em Cadastrar, você concorda com nossos Termos, Condições e Políticas de Dados"),
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
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFF22B995),
                        ),
                        child: SizedBox.expand(
                          child: FlatButton(
                            onPressed: () {
                              _validarCampos();
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
                              "Cadastrar",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontFamily: "Big Shoulders Display",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 10),
                        child: Center(
                          child: Text(
                            " - OU SE PREFERIR - ",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFA0A4AB),
                        ),
                        child: SizedBox.expand(
                          child: FlatButton(
                            onPressed: () {
                              _validarCampos();
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage("assets/google_logo.png"),
                                  height: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Entrar com o Google",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Center(
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Tem uma conta? Entre aqui",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        _mensagemErro,
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
