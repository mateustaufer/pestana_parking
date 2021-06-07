class VeiculoModel {
  int id;
  String marca;
  String modelo;
  String placa;
  String ano;
  String cpf;

  VeiculoModel({
    this.id,
    this.marca,
    this.modelo,
    this.placa,
    this.ano,
    this.cpf,
  });

  VeiculoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    marca = json['marca'];
    modelo = json['modelo'];
    placa = json['placa'];
    ano = json['ano'];
    cpf = json['cpf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['marca'] = this.marca;
    data['modelo'] = this.modelo;
    data['placa'] = this.placa;
    data['ano'] = this.ano;
    data['cpf'] = this.cpf;
    return data;
  }
}
