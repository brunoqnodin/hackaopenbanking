import 'package:flutter/material.dart';
import 'package:openbanking/Pages/ResetPassword.dart';
import 'package:openbanking/Pages/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:openbanking/Pages/bloc/bloc.login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _logarUsuario(Usuario usuario) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .signInWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((firebaseUser) {
      Navigator.pushReplacementNamed(context, "/home");
    }).catchError((error) {
      setState(() {
        mensagemErro = "Erro ao autenticar usuário, verifique e-mail e senha";
      });
    });
  }

  _validarCampos() {
    String email = controllerEmail.text;
    String senha = controllerSenha.text;
    if (email.isNotEmpty && email.contains("@")) {
      if (senha.isNotEmpty) {
        setState(() {
          mensagemErro = "";
        });
        Usuario usuario = Usuario();
        usuario.email = email;
        usuario.senha = senha;
        _logarUsuario(usuario);
      } else {
        setState(() {
          mensagemErro = "Preencha a senha";
        });
      }
    } else {
      setState(() {
        mensagemErro = "Utilize um e-mail válido";
      });
    }
  }

  Future _verificarUsuarioLogado() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User usuarioLogado = await auth.currentUser;
    if (usuarioLogado != null) {
      Navigator.pushReplacementNamed(context, "/home");
    } else {}
  }

  @override
  void initState() {
    _verificarUsuarioLogado();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(32),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Open Banking")
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                          width: 2.0,
                        ),
                      ),
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                          fontSize: 25,
                          fontFamily: "Big Shoulders Display",
                          color: Colors.blueGrey
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controllerSenha,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                          width: 2.0,
                        ),
                      ),
                      labelText: "Senha",
                      labelStyle: TextStyle(
                          fontSize: 25,
                          fontFamily: "Big Shoulders Display",
                          color: Colors.blueGrey
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/reset");
                        },
                        child: Text(
                          "Recuperar senha",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white70),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/cadLogin");
                        },
                        child: Text(
                          "Cadastre-se",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 1],
                        colors: [Colors.deepOrange, Colors.orange],
                      ),
                    ),
                    child: SizedBox.expand(
                      child: FlatButton(
                        onPressed: () {
                          _validarCampos();
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: "Big Shoulders Display",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      mensagemErro,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
