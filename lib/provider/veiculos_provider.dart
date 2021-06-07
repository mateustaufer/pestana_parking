import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pestana_parking/models/veiculo_model.dart';

class VeiculosProvider with ChangeNotifier {
  static const _baseUrl = 'http://192.168.0.107:8080/api';
  static const headers = {
    'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
    'Content-Type': 'application/json',
  };

  List<VeiculoModel> _veiculos = [];

  Future<List<VeiculoModel>> _getVeiculos() async {
    List<VeiculoModel> listItems = [];
    final response = await http.get("$_baseUrl/veiculo");
    if (response.statusCode == 200) {
      var decodeJson = jsonDecode(response.body);
      decodeJson.forEach((item) => listItems.add(VeiculoModel.fromJson(item)));
      notifyListeners();
      return listItems;
    } else {
      print("Erro ao carregar a Lista de Veículos.");
      return null;
    }
  }

  int get count {
    _getVeiculos().then((map) {
      _veiculos = map;
    });
    return _veiculos.length;
  }

  VeiculoModel byIndex(int i) {
    _getVeiculos().then((map) {
      _veiculos = map;
    });
    return _veiculos.elementAt(i);
  }

  Future<void> salvar(VeiculoModel veiculo) async {
    if (veiculo.id != null || veiculo.id != 0) {
      await http.put(
        _baseUrl + '/veiculo/atualizar',
        headers: headers,
        body: json.encode(veiculo.toJson()),
      );
    } else {
      await http.post(
        _baseUrl + '/veiculo/salvar',
        headers: headers,
        body: json.encode(veiculo.toJson()),
      );
    }

    notifyListeners();
  }

  Future<void> delete(int id) async {
    await http.delete(
      _baseUrl + '/veiculo/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    notifyListeners();
  }
}
