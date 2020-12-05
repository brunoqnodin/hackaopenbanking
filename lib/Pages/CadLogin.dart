import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:openbanking/pages/Home.dart';
import 'package:openbanking/Pages/ui/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadLogin extends StatefulWidget {
  @override
  _CadLoginState createState() => _CadLoginState();
}

class _CadLoginState extends State<CadLogin> {
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  TextEditingController _controllerCpf = TextEditingController();
  TextEditingController _controllerEndereco = TextEditingController();
  TextEditingController _controllerCidade = TextEditingController();
  TextEditingController _controllerEstado = TextEditingController();
  TextEditingController _controllerCep  = TextEditingController();
  TextEditingController _controllerNascimento  = TextEditingController();
  String _mensagemErro = "";

  FocusNode _nodeEmail = FocusNode();
  FocusNode _nodeNome = FocusNode();
  FocusNode _nodeCpf = FocusNode();
  FocusNode _nodeNascimento = FocusNode();
  FocusNode _nodeEndereco = FocusNode();
  FocusNode _nodeCidade = FocusNode();
  FocusNode _nodeEstado = FocusNode();
  FocusNode _nodeCep = FocusNode();
  FocusNode _nodeSenha = FocusNode();

  _logoffUsuario()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    Navigator.pushReplacementNamed(context, "/login");
  }
  _cadastrarUsuario(Usuario usuario){

    FirebaseAuth auth = FirebaseAuth.instance;

    auth.createUserWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha).then((firebaseUser){

      FirebaseFirestore db = FirebaseFirestore.instance;
      db.collection("usuarios").doc(firebaseUser.user.uid).set(usuario.toMap());

      _logoffUsuario();
    }).catchError((error){
      setState(() {
        _mensagemErro = "Erro ao cadastrar usuário";
      });
    });

  }

  _validarCampos(){

    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;
    String cpf = _controllerCpf.text;
    String endereco = _controllerEndereco.text;
    String cidade = _controllerCidade.text;
    String estado = _controllerEstado.text;
    String cep = _controllerCep.text;
    String nascimento = _controllerNascimento.text;
    String url = "";

    if(nome.isNotEmpty){
      if(email.isNotEmpty && email.contains("@")){
        if(senha.isNotEmpty){
          setState(() {
            _mensagemErro = "";
          });
          Usuario usuario = Usuario();
          usuario.nome = nome;
          usuario.email = email;
          usuario.senha = senha;
          usuario.cpf = cpf;
          usuario.endereco = endereco;
          usuario.cidade = cidade;
          usuario.estado = estado;
          usuario.cep = cep;
          usuario.nascimento = nascimento;
          usuario.urlImagem = url;


          _cadastrarUsuario(usuario);
        }else{
          setState(() {
            _mensagemErro = "Preencha a senha";
          });
        }
      }else{
        setState(() {
          _mensagemErro = "Utilize um e-mail válido";
        });
      }
    }else{
      setState(() {
        _mensagemErro = "Preencha o Nome";
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF20232D)),
        title: Text("Cadastro", style: TextStyle(color: Color(0xFF20232D)),),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Text("Cadastrar Usuário", style: TextStyle(fontSize: 20, color: Colors.black54),)
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    cursorColor: Colors.deepOrange,
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    focusNode: _nodeEmail,
                    onFieldSubmitted: (term){
                      FocusScope.of(context).requestFocus(_nodeNome);
                    },
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(color: Colors.white38),
                      fillColor: Colors.deepOrange,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFFEE7700),
                      fontFamily: "Big Shoulders Display",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    cursorColor: Colors.deepOrange,
                    controller: _controllerNome,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: _nodeNome,
                    onFieldSubmitted: (term){
                      FocusScope.of(context).requestFocus(_nodeCpf);
                    },
                    decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(color: Colors.white38),
                      fillColor: Colors.deepOrange,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFFEE7700),
                      fontFamily: "Big Shoulders Display",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    cursorColor: Colors.deepOrange,
                    controller: _controllerCpf,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    focusNode: _nodeCpf,
                    onFieldSubmitted: (term){
                      FocusScope.of(context).requestFocus(_nodeNascimento);
                    },
                    decoration: InputDecoration(
                      labelText: "CPF",
                      labelStyle: TextStyle(color: Colors.white38),
                      fillColor: Colors.deepOrange,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFFEE7700),
                      fontFamily: "Big Shoulders Display",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    cursorColor: Colors.deepOrange,
                    controller: _controllerNascimento,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    focusNode: _nodeNascimento,
                    onFieldSubmitted: (term){
                      FocusScope.of(context).requestFocus(_nodeEndereco);
                    },
                    decoration: InputDecoration(
                      labelText: "Data de Nascimento",
                      labelStyle: TextStyle(color: Colors.white38),
                      fillColor: Colors.deepOrange,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFFEE7700),
                      fontFamily: "Big Shoulders Display",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    cursorColor: Colors.deepOrange,
                    controller: _controllerEndereco,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: _nodeEndereco,
                    onFieldSubmitted: (term){
                      FocusScope.of(context).requestFocus(_nodeCidade);
                    },
                    decoration: InputDecoration(
                      labelText: "Endereço",
                      labelStyle: TextStyle(color: Colors.white38),
                      fillColor: Colors.deepOrange,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFFEE7700),
                      fontFamily: "Big Shoulders Display",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    cursorColor: Colors.deepOrange,
                    controller: _controllerCidade,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: _nodeCidade,
                    onFieldSubmitted: (term){
                      FocusScope.of(context).requestFocus(_nodeEstado);
                    },
                    decoration: InputDecoration(
                      labelText: "Cidade",
                      labelStyle: TextStyle(color: Colors.white38),
                      fillColor: Colors.deepOrange,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFFEE7700),
                      fontFamily: "Big Shoulders Display",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    cursorColor: Colors.deepOrange,
                    controller: _controllerEstado,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: _nodeEstado,
                    onFieldSubmitted: (term){
                      FocusScope.of(context).requestFocus(_nodeCep);
                    },
                    decoration: InputDecoration(
                      labelText: "Estado",
                      labelStyle: TextStyle(color: Colors.white38),
                      fillColor: Colors.deepOrange,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFFEE7700),
                      fontFamily: "Big Shoulders Display",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    cursorColor: Colors.deepOrange,
                    controller: _controllerCep,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    focusNode: _nodeCep,
                    onFieldSubmitted: (term){
                      FocusScope.of(context).requestFocus(_nodeSenha);
                    },
                    decoration: InputDecoration(
                      labelText: "CEP",
                      labelStyle: TextStyle(color: Colors.white38),
                      fillColor: Colors.deepOrange,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFFEE7700),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    cursorColor: Colors.deepOrange,
                    controller: _controllerSenha,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    focusNode: _nodeSenha,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.white38),
                      fillColor: Colors.deepOrange,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xFFEE7700),
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFFEE7700),
                      fontFamily: "Big Shoulders Display",
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3, 1],
                      colors: [Colors.deepOrange, Color(0xFFEE7700)],
                    ),
                  ),
                  child: SizedBox.expand(
                    child: FlatButton(
                      onPressed: () {
                        _validarCampos();
                        return showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context){
                              return AlertDialog(
                                title: Text("Dados Cadastrados com Sucesso!"),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            }
                        );
                      },
                      child: Text(
                        "SALVAR",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: "Big Shoulders Display",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Text(
                  _mensagemErro,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}