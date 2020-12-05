import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  @override
  TextEditingController _controllerEmail = TextEditingController();
  Future<void> resetPassword(String email) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User usuarioLogado = await auth.currentUser;
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resetar Senha", style: TextStyle(color: Color(0xFF20232D)),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: (){
            Navigator.pop(context, false);
          },
        ),
        backgroundColor: Color(0xFFEE7700),
      ),
      body: Container(
          padding: EdgeInsets.all(32),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Image.asset("images/password.png"),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Esqueceu sua senha?",
                    style: TextStyle(
                        color: Color(0xFFEE7700),
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Big Shoulders Display"
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Por favor, informe o e-mail associado a sua conta que enviaremos um link para o mesmo com as instruções para restauração de sua senha.",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                        fontFamily: "Big Shoulders Display"
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:10, bottom: 20),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.deepOrange,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: _controllerEmail,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                          width: 2.0,
                        ),
                      ),
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: "Big Shoulders Display",
                        color: Color(0xFFEE7700)
                      ),
                    ),
                  ),
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
                      colors: [
                        Colors.deepOrange,
                        Colors.orange
                      ],
                    ),
                  ),
                  child: SizedBox.expand(
                    child: FlatButton(
                      onPressed: (){
                        resetPassword(_controllerEmail.text);
                      },
                      child: Text(
                        "Enviar",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: "Big Shoulders Display",
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
