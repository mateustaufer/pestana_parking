import 'package:flutter/material.dart';
import 'package:pestana_parking/models/pessoa_model.dart';
import 'package:pestana_parking/provider/pessoas_provider.dart';
import 'package:provider/provider.dart';

class PessoaForm extends StatefulWidget {
  @override
  _PessoaModelFormState createState() => _PessoaModelFormState();
}

class _PessoaModelFormState extends State<PessoaForm> {
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;

  final Map<Object, Object> _formData = {};

  void _loadFormData(PessoaModel pessoa) {
    if (pessoa != null) {
      _formData['id'] = pessoa.id;
      _formData['cpf'] = pessoa.cpf;
      _formData['nome'] = pessoa.nome;
      _formData['telefone'] = pessoa.telefone;
      _formData['apartamento'] = pessoa.apartamento;
      _formData['dataNascimento'] = pessoa.dataNascimento;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final PessoaModel pessoa = ModalRoute.of(context).settings.arguments;
    _loadFormData(pessoa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Pessoa'),
          actions: <Widget>[
            IconButton(
                onPressed: () async {
                  final isValid = _form.currentState.validate();

                  if (isValid) {
                    _form.currentState.save();

                    setState(() {
                      _isLoading = true;
                    });

                    await Provider.of<PessoasProvider>(context, listen: false)
                        .salvar(PessoaModel(
                      id: _formData['id'],
                      cpf: _formData['cpf'],
                      nome: _formData['nome'],
                      telefone: _formData['telefone'],
                      apartamento: _formData['apartamento'],
                      dataNascimento: _formData['dataNascimento'],
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
                          initialValue: _formData['nome'],
                          decoration: InputDecoration(labelText: 'Nome'),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'O campo nome não pode ficar em branco.';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) => _formData['nome'] = value,
                        ),
                        TextFormField(
                          initialValue: _formData['telefone'],
                          decoration: InputDecoration(labelText: 'Telefone'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'O campo Telefone não pode ficar em branco.';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) => _formData['telefone'] = value,
                        ),
                        TextFormField(
                          initialValue: _formData['cpf'],
                          decoration: InputDecoration(labelText: 'CPF'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'O campo CPF não pode ficar em branco.';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) => _formData['cpf'] = value,
                        ),
                        TextFormField(
                          initialValue: _formData['apartamento'],
                          decoration: InputDecoration(labelText: 'Apartamento'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'O campo Apartamento não pode ficar em branco.';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) => _formData['apartamento'] = value,
                        ),
                        TextFormField(
                          initialValue: _formData['dataNascimento'],
                          decoration:
                              InputDecoration(labelText: 'Data de Nascimento'),
                          keyboardType: TextInputType.datetime,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'O campo Data de Nascimento não pode ficar em branco.';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) =>
                              _formData['dataNascimento'] = value,
                        ),
                      ],
                    )),
              ));
  }
}
