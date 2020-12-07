import 'package:flutter/material.dart';

class Propostas extends StatefulWidget {
  @override
  _PropostasState createState() => _PropostasState();
}

class _PropostasState extends State<Propostas> {
  bool _proximidade=false;
  bool _juros=false;
  TextEditingController _controllerKm = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 70, bottom: 30),
            child: Text("Solicitar Crédito", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),),
          ),
          CheckboxListTile(
            title: Text(
                "Por proximidade"),
            value: _proximidade,
            onChanged: (_contratonovo){
              setState(() {
                _proximidade = _contratonovo;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: Text(
                "Menor taxas de juros"),
            value: _juros,
            onChanged: (_contratonovo){
              setState(() {
                _juros = _contratonovo;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
            child:  Divider(
              color: Colors.black,
            ),
          ),
          Text("Valor do crédito", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 16),),
          Padding(
            padding: EdgeInsets.only(left:25, top: 20, bottom: 10, right: 25),
            child: TextFormField(
              controller: _controllerKm,
              keyboardType: TextInputType.number,
              obscureText: true,
              style: TextStyle(
                color: Colors.blueGrey,
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(
                  Icons.monetization_on,
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
                    Navigator.pushNamed(context, "/proposta1");
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
