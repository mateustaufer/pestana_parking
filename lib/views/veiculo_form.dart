import 'package:flutter/material.dart';
import 'package:pestana_parking/models/veiculo_model.dart';
import 'package:pestana_parking/provider/veiculos_provider.dart';
import 'package:provider/provider.dart';

class VeiculoForm extends StatefulWidget {
  @override
  _VeiculoModelFormState createState() => _VeiculoModelFormState();
}

class _VeiculoModelFormState extends State<VeiculoForm> {
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;

  final Map<Object, Object> _formData = {};

  void _loadFormData(VeiculoModel veiculo) {
    if (veiculo != null) {
      _formData['id'] = veiculo.id;
      _formData['marca'] = veiculo.marca;
      _formData['modelo'] = veiculo.modelo;
      _formData['placa'] = veiculo.placa;
      _formData['ano'] = veiculo.ano;
      _formData['cpf'] = veiculo.cpf;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final VeiculoModel veiculo = ModalRoute.of(context).settings.arguments;
    _loadFormData(veiculo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Veículo'),
          actions: <Widget>[
            IconButton(
                onPressed: () async {
                  final isValid = _form.currentState.validate();

                  if (isValid) {
                    _form.currentState.save();

                    setState(() {
                      _isLoading = true;
                    });

                    await Provider.of<VeiculosProvider>(context, listen: false)
                        .salvar(VeiculoModel(
                      id: _formData['id'],
                      marca: _formData['marca'],
                      modelo: _formData['modelo'],
                      placa: _formData['placa'],
                      ano: _formData['ano'],
                      cpf: _formData['cpf'],
                    ));

                    setState(() {
                      _isLoading = false;
                    });

                    Navigator.of(context).pop();
                  }
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(15),
                child: Form(
                    key: _form,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: _formData['marca'],
                          decoration: InputDecoration(labelText: 'Marca'),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'O campo Marca não pode ficar em branco.';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) => _formData['marca'] = value,
                        ),
                        TextFormField(
                          initialValue: _formData['modelo'],
                          decoration: InputDecoration(labelText: 'Modelo'),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'O campo Modelo não pode ficar em branco.';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) => _formData['modelo'] = value,
                        ),
                        TextFormField(
                          initialValue: _formData['placa'],
                          decoration: InputDecoration(labelText: 'Placa'),
                          onSaved: (value) => _formData['placa'] = value,
                        ),
                        TextFormField(
                          initialValue: _formData['ano'],
                          decoration: InputDecoration(labelText: 'Ano'),
                          keyboardType: TextInputType.number,
                          onSaved: (value) => _formData['ano'] = value,
                        ),
                        TextFormField(
                          initialValue: _formData['cpf'],
                          decoration: InputDecoration(labelText: 'CPF'),
                          keyboardType: TextInputType.number,
                          onSaved: (value) => _formData['cpf'] = value,
                        ),
                      ],
                    )),
              ));
  }
}
