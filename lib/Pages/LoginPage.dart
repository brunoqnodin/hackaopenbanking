import 'package:flutter/material.dart';
import 'package:openbanking/Pages/ResetPassword.dart';
import 'package:openbanking/Pages/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:openbanking/Pages/bloc/bloc.login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:openbanking/Pages/ui/clipper.dart';

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
      appBar: AppBar(
        backgroundColor: Color(0xFF2A5C5B),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF8F9FA),
      body: Stack(
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
            width: double.infinity,
            padding: EdgeInsets.all(32),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Faça seu login", style: TextStyle(fontSize: 20, color: Colors.blueGrey),)
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
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.account_circle, color: Colors.blue,),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: "Usuário",
                      labelStyle: TextStyle(
                          fontSize: 20,
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
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.lock, color: Colors.blue,),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: "Senha",
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFF22B995),
                    ),
                    child: SizedBox.expand(
                      child: FlatButton(
                        onPressed: () {
                          _validarCampos();
                        },
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/reset");
                    },
                    child: Text(
                      "Esqueci minha senha",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black45),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: Text(" - OU SE PREFERIR - ", style: TextStyle(color: Colors.grey),),
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
                            Image(image: AssetImage("assets/google_logo.png"), height: 25,),
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
                          Navigator.pushNamed(context, "/cadLogin");
                        },
                        child: Text(
                          "Ainda não tem conta? Cadastre-se",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey),
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
