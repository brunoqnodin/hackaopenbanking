class IdDocumento{

  String _agencia;
  String _banco;
  String _conta;

  IdDocumento();

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "conta": this.conta,
      "banco": this.banco,
      "agencia": this.agencia
    };
    return map;
  }

  String get conta => _conta;

  set conta(String value) {
    _conta = value;
  }

  String get banco => _banco;

  set banco(String value) {
    _banco = value;
  }

  String get agencia => _agencia;

  set agencia(String value) {
    _agencia = value;
  }


}

class Argumento{
  String _argument;

  Argumento(this._argument);

  String get argument => _argument;

  set argument(String value) {
    _argument = value;
  }


}