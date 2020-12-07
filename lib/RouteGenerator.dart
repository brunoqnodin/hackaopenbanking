import 'package:flutter/material.dart';
import 'package:openbanking/Contas.dart';
import 'package:openbanking/Pages/Cadastro.dart';
import 'package:openbanking/Pages/Cadastro1.dart';
import 'package:openbanking/Pages/Contas1.dart';
import 'package:openbanking/Pages/LoginPage.dart';
import 'package:openbanking/Pages/CadLogin.dart';
import 'package:openbanking/Pages/Proposta1.dart';
import 'package:openbanking/Pages/Propostas.dart';
import 'package:openbanking/Pages/ResetPassword.dart';
import 'package:openbanking/Pages/Home.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    String _resultado = "";
    final args = settings.arguments as String;

    switch(settings.name){
      case "/":
        return MaterialPageRoute(builder: (_) => LoginPage());
      case "/login":
        return MaterialPageRoute(builder: (_) => LoginPage());
      case "/cadastro":
        return MaterialPageRoute(builder: (_) => Cadastro());
      case "/cadLogin":
        return MaterialPageRoute(builder: (_) => CadLogin());
      case "/reset":
        return MaterialPageRoute(builder: (_) => ResetPassword());
      case "/cadastro1":
        return MaterialPageRoute(builder: (_) => Cadastro1());
      case "/contas":
        return MaterialPageRoute(builder: (_) => Contas());
      case "/contas1":
        return MaterialPageRoute(builder: (_) => Contas1());
      case "/proposta1":
        return MaterialPageRoute(builder: (_) => Proposta1());
      case "/proposta":
        return MaterialPageRoute(builder: (_) => Propostas());
      case "/home":
        return MaterialPageRoute(builder: (_) => Home());
      default: _erroRota();
    }

  }
  static Route<dynamic> _erroRota(){
    return MaterialPageRoute(
      builder: (_){
        return Scaffold(
          appBar: AppBar(title: Text("Tela não encontrada"),),
          body: Center(child: Text("Tela não encontrada"),),
        );
      }
    );
  }
}
