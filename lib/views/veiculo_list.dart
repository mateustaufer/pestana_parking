import 'package:flutter/material.dart';
import 'package:pestana_parking/provider/veiculos_provider.dart';
import 'package:pestana_parking/routes/app_routes.dart';
import 'package:pestana_parking/widgets/veiculo_tile.dart';
import 'package:provider/provider.dart';

class VeiculoList extends StatefulWidget {
  @override
  _VeiculoListState createState() => _VeiculoListState();
}

class _VeiculoListState extends State<VeiculoList> {
  @override
  Widget build(BuildContext context) {
    final VeiculosProvider veiculos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Veículos'),
      ),
      body: ListView.builder(
        itemCount: veiculos.count,
        itemBuilder: (ctx, i) => VeiculoTile(veiculos.byIndex(i)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.VEICULO_FORM);
        },
        tooltip: 'Cadastrar um Veículo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
