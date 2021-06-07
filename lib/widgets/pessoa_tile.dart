import 'package:flutter/material.dart';
import 'package:pestana_parking/models/pessoa_model.dart';
import 'package:pestana_parking/provider/pessoas_provider.dart';
import 'package:pestana_parking/routes/app_routes.dart';
import 'package:provider/provider.dart';

class PessoaTile extends StatelessWidget {
  final PessoaModel pessoa;
  const PessoaTile(this.pessoa);

  @override
  Widget build(BuildContext context) {
    //final avatar = CircleAvatar(child: Icon(Icons.person));
    final car = IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          AppRoutes.VEICULO_LIST,
          arguments: pessoa.cpf,
        );
      },
      color: Colors.green,
      icon: Icon(Icons.car_repair),
      iconSize: 40,
    );
    return ListTile(
      leading: car,
      title: Text(pessoa.nome),
      subtitle: Text(pessoa.telefone),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.PESSOA_FORM, arguments: pessoa);
                },
                color: Colors.orange,
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                              title: Text('Excluir Pessoa'),
                              content: Text('Deseja excluir a Pessoa?'),
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
                      Provider.of<PessoasProvider>(context, listen: false)
                          .delete(pessoa.id);
                    }
                  });
                },
                color: Colors.red,
                icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
