import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/home.png"),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              "Pronto para iniciar?",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
                "Agora precisamos sincronizar seus dados financeiros. Por favor, informe as contas bancárias do seu empreendimento.",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF22B995),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  onPressed: () {
                        (){};
                  },
                  child: Text(
                    "Sincronizar conta(s)",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
