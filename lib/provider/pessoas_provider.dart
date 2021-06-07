import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pestana_parking/models/pessoa_model.dart';

class PessoasProvider with ChangeNotifier {
  static const _baseUrl = 'http://192.168.0.107:8080/api';
  static const headers = {
    'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
    'Content-Type': 'application/json',
  };

  List<PessoaModel> _pessoas = [];

  Future<List<PessoaModel>> _getPessoas() async {
    List<PessoaModel> listItems = [];
    final response = await http.get("$_baseUrl/pessoa");
    if (response.statusCode == 200) {
      var decodeJson = jsonDecode(response.body);
      decodeJson.forEach((item) => listItems.add(PessoaModel.fromJson(item)));
      notifyListeners();
      return listItems;
    } else {
      print("Erro ao carregar a Lista de Pessoas.");
      return null;
    }
  }

  int get count {
    _getPessoas().then((map) {
      _pessoas = map;
    });
    return _pessoas.length;
  }

  PessoaModel byIndex(int i) {
    _getPessoas().then((map) {
      _pessoas = map;
    });
    return _pessoas.elementAt(i);
  }

  Future<void> salvar(PessoaModel pessoa) async {
    if (pessoa.id != null || pessoa.id != 0) {
      await http.put(
        _baseUrl + '/pessoa/atualizar',
        headers: headers,
        body: json.encode(pessoa.toJson()),
      );
    } else {
      await http.post(
        _baseUrl + '/pessoa/salvar',
        headers: headers,
        body: json.encode(pessoa.toJson()),
      );
    }

    notifyListeners();
  }

  Future<void> delete(int id) async {
    await http.delete(
      _baseUrl + '/pessoa/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    notifyListeners();
  }
}
