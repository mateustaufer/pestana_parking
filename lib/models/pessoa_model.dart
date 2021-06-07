class PessoaModel {
  int id;
  String nome;
  String cpf;
  String apartamento;
  String dataNascimento;
  String telefone;

  PessoaModel(
      {this.id,
      this.nome,
      this.cpf,
      this.apartamento,
      this.dataNascimento,
      this.telefone});

  PessoaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cpf = json['cpf'];
    apartamento = json['apartamento'];
    dataNascimento = json['data_nascimento'];
    telefone = json['telefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['apartamento'] = this.apartamento;
    data['data_nascimento'] = this.dataNascimento;
    data['telefone'] = this.telefone;
    return data;
  }
}
