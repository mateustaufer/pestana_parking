import 'package:flutter/material.dart';
import 'package:pestana_parking/models/veiculo_model.dart';
import 'package:pestana_parking/provider/veiculos_provider.dart';
import 'package:pestana_parking/routes/app_routes.dart';
import 'package:provider/provider.dart';

class VeiculoTile extends StatelessWidget {
  final VeiculoModel veiculo;
  const VeiculoTile(this.veiculo);

  @override
  Widget build(BuildContext context) {
    final avatar = CircleAvatar(child: Icon(Icons.car_repair_rounded));
    return ListTile(
      leading: avatar,
      title: Text(veiculo.modelo),
      subtitle: Text(veiculo.placa),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.VEICULO_FORM, arguments: veiculo);
                },
                color: Colors.orange,
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                              title: Text('Excluir Veículo'),
                              content: Text('Deseja excluir o Veículo?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Não'),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                ),
                                TextButton(
                                  child: Text('Sim'),
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                ),
                              ])).then((confirmed) {
                    if (confirmed) {
                      Provider.of<VeiculosProvider>(context, listen: false)
                          .delete(veiculo.id);
                    }
                  });
                },
                color: Colors.red,
                icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
