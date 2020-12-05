class Usuario{

  String _nome;
  String _email;
  String _senha;
  String _cpf;
  String _endereco;
  String _cidade;
  String _estado;
  String _cep;
  String _nascimento;
  String _urlImagem;

  Usuario();

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "nome": this.nome,
      "email": this.email,
      "cpf": this._cpf,
      "endereco": this._endereco,
      "cidade": this._cidade,
      "estado": this._estado,
      "cep": this._cep,
      "nascimento": this._nascimento,
      "urlImagem": this._urlImagem
    };
    return map;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get cpf => _cpf;

  set cpf(String value) {
    _cpf = value;
  }

  String get cep => _cep;

  set cep(String value) {
    _cep = value;
  }

  String get estado => _estado;

  set estado(String value) {
    _estado = value;
  }

  String get cidade => _cidade;

  set cidade(String value) {
    _cidade = value;
  }

  String get endereco => _endereco;

  set endereco(String value) {
    _endereco = value;
  }

  String get nascimento => _nascimento;

  set nascimento(String value) {
    _nascimento = value;
  }

  String get urlImagem => _urlImagem;

  set urlImagem(String value) {
    _urlImagem = value;
  }


}