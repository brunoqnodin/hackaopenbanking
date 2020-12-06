import 'package:flutter/material.dart';

class Contas extends StatefulWidget {
  @override
  _ContasState createState() => _ContasState();
}

class _ContasState extends State<Contas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
          ),
          Card(
            child: Container(
              width: 350,
              height: 300,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Sincronização da(s) conta(s)", style: TextStyle(fontSize: 23),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "A sincronização da(s) conta(s) do seu empreendimento dará acesso apenas ao modo de visualização dos seus dados. Desta forma, será possível analisar o momento financeiro da sua empresa de forma rápida, segura e descomplicada sem a necessidade de enviar qualquer documento.",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            child: Container(
              color: Color(0xFF0F7674),
              width: 350,
              height: 180,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Segurança de nível bancário", style: TextStyle(fontSize: 25, color: Colors.white),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "A plataforma OpenMiner utiliza a segurança de nível bancário para garantir o sigilo dos seus dados.",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
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
                    Navigator.pushNamed(context, "/contas1");
                  },
                  child: Text(
                    "Continuar",
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
