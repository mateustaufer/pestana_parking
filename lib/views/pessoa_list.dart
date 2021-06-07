import 'package:flutter/material.dart';
import 'package:pestana_parking/provider/pessoas_provider.dart';
import 'package:pestana_parking/routes/app_routes.dart';
import 'package:pestana_parking/widgets/pessoa_tile.dart';
import 'package:provider/provider.dart';

class PessoaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PessoasProvider pessoas = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de Pessoas'),
      ),
      body: ListView.builder(
        itemCount: pessoas.count,
        itemBuilder: (ctx, i) => PessoaTile(pessoas.byIndex(i)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.PESSOA_FORM);
        },
        tooltip: 'Cadastrar uma Pessoa',
        child: const Icon(Icons.add),
      ),
    );
  }
}
