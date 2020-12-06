import 'package:flutter/material.dart';
import 'package:openbanking/Pages/ui/clipper.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logoopenminer2.png",
          height: 40,
        ),
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
              width: double.infinity,
              padding: EdgeInsets.only(top: 120),
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
                            Navigator.pushNamed(context, "/cadastro1");
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
            ),
          ],
        ),
      ),
    );
  }
}
