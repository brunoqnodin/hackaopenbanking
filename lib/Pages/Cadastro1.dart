import 'package:flutter/material.dart';
import 'package:openbanking/Pages/ui/clipper.dart';

class Cadastro1 extends StatefulWidget {
  @override
  _Cadastro1State createState() => _Cadastro1State();
}

class _Cadastro1State extends State<Cadastro1> {
  var _empresa_formalizada;
  TextEditingController _controllerCpf = TextEditingController();
  TextEditingController _controllerCep = TextEditingController();
  TextEditingController _controllerOutroRecurso = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Openbanking"),
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
                      "Possui empresa formalizada?",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton.icon(
                        icon: Icon(Icons.thumb_up),
                        label: Text("Sim"),
                        color: Colors.white,
                        onPressed: () => {_empresa_formalizada = "Sim"},
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: RaisedButton.icon(
                          icon: Icon(Icons.thumb_up),
                          label: Text("Não"),
                          color: Colors.white,
                          onPressed: () => {_empresa_formalizada = "Não"},
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "Informe seu CPF",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: TextFormField(
                      controller: _controllerCpf,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: "CPF",
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "Informe seu CEP",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: TextFormField(
                      controller: _controllerCep,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.map,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: "CEP",
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "O que seu empreendimento mais precisa?",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                            width: 150,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFF22B995),
                            ),
                            child: SizedBox.expand(
                              child: FlatButton(
                                onPressed: () {},
                                child: Text(
                                  "Unificar extratos bancários",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                            width: 150,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFF22B995),
                            ),
                            child: SizedBox.expand(
                              child: FlatButton(
                                onPressed: () {},
                                child: Text(
                                  "Controlar fluxo de caixa",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
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
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                            width: 150,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFF22B995),
                            ),
                            child: SizedBox.expand(
                              child: FlatButton(
                                onPressed: () {},
                                child: Text(
                                  "Análise de crédito",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                            width: 150,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFF22B995),
                            ),
                            child: SizedBox.expand(
                              child: FlatButton(
                                onPressed: () {},
                                child: Text(
                                  "Analisar score",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
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
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "Outro recurso?",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: TextFormField(
                      controller: _controllerOutroRecurso,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.question_answer,
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
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "O que seu empreendimento mais precisa?",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                            width: 160,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFF22B995),
                            ),
                            child: SizedBox.expand(
                              child: FlatButton.icon(
                                icon: Icon(
                                  Icons.account_circle,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                                label: Text(
                                  "Agropecuária",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                            width: 160,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFF22B995),
                            ),
                            child: SizedBox.expand(
                              child: FlatButton.icon(
                                icon: Icon(Icons.settings,
                                    color: Colors.white),
                                onPressed: () {},
                                label: Text(
                                  "Industria",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
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
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                            width: 160,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFF22B995),
                            ),
                            child: SizedBox.expand(
                              child: FlatButton.icon(
                                icon: Icon(Icons.shopping_cart,
                                    color: Colors.white),
                                onPressed: () {},
                                label: Text(
                                  "Comércio",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                            width: 160,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFF22B995),
                            ),
                            child: SizedBox.expand(
                              child: FlatButton.icon(
                                icon: Icon(Icons.build, color: Colors.white),
                                onPressed: () {},
                                label: Text(
                                  "Serviço",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                            width: 160,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFF22B995),
                            ),
                            child: SizedBox.expand(
                              child: FlatButton.icon(
                                icon: Icon(Icons.category,
                                    color: Colors.white),
                                onPressed: () {},
                                label: Text(
                                  "Construção",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Container(
                            width: 160,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFF22B995),
                            ),
                            child: SizedBox.expand(
                              child: FlatButton.icon(
                                icon: Icon(Icons.help, color: Colors.white),
                                onPressed: () {},
                                label: Text(
                                  "Outro",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
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
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "Segmento",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 30),
                    child: TextFormField(
                      controller: _controllerCep,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.map,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
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
                              fontWeight: FontWeight.bold),
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
