import 'package:flutter/material.dart';
import 'package:openbanking/Pages/ui/clipper.dart';

class Relatorios extends StatefulWidget {
  @override
  _RelatoriosState createState() => _RelatoriosState();
}

class _RelatoriosState extends State<Relatorios> {
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

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
