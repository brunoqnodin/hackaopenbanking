import 'package:flutter/material.dart';
import 'package:openbanking/Pages/ui/clipper.dart';

class Proposta1 extends StatefulWidget {
  @override
  _Proposta1State createState() => _Proposta1State();
}

class _Proposta1State extends State<Proposta1> {
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
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:70, bottom: 30),
                    child: Text("Clique na opção desejada", style: TextStyle(fontSize: 22, color: Color(0xFF1B8477), fontWeight: FontWeight.bold),),
                  ),
                  Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 20),
                          child: Text("Banco 1", style: TextStyle(fontSize: 20, color: Color(0xFF1B8477), fontWeight: FontWeight.bold),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("Taxa de Juros: 9,5%", style: TextStyle(fontSize: 16),),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("Distancia: 7km", style: TextStyle(fontSize: 16),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 20),
                          child: Text("Banco 2", style: TextStyle(fontSize: 20, color: Color(0xFF1B8477), fontWeight: FontWeight.bold),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("Taxa de Juros: 10%", style: TextStyle(fontSize: 16),),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("Distancia: 12km", style: TextStyle(fontSize: 16),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 20),
                          child: Text("Banco 3", style: TextStyle(fontSize: 20, color: Color(0xFF1B8477), fontWeight: FontWeight.bold),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("Taxa de Juros: 7,5%", style: TextStyle(fontSize: 16),),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("Distancia: 11km", style: TextStyle(fontSize: 16),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 20),
                          child: Text("Banco 4", style: TextStyle(fontSize: 20, color: Color(0xFF1B8477), fontWeight: FontWeight.bold),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("Taxa de Juros: 11%", style: TextStyle(fontSize: 16),),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("Distancia: 44km", style: TextStyle(fontSize: 16),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
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
                          },
                          child: Text(
                            "Solicitar crédito",
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
