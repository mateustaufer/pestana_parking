import 'package:flutter/material.dart';
import 'package:pestana_parking/routes/app_routes.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pestana Parking'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PESSOA_LIST);
              },
              child: Text(
                'Lista de Pessoas',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.VEICULO_LIST);
              },
              child: Text(
                'Lista de Veiculos',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.of(context).pushNamed(AppRoutes.VAGA_LIST);
              },
              child: Text(
                'Vagas',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
