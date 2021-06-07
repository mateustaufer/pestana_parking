import 'package:flutter/material.dart';
import 'package:pestana_parking/provider/veiculos_provider.dart';
import 'package:pestana_parking/routes/app_routes.dart';
import 'package:pestana_parking/views/home.dart';
import 'package:pestana_parking/views/pessoa_form.dart';
import 'package:pestana_parking/views/pessoa_list.dart';
import 'package:pestana_parking/views/veiculo_form.dart';
import 'package:pestana_parking/views/veiculo_list.dart';
import 'package:provider/provider.dart';
import 'package:pestana_parking/provider/pessoas_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => PessoasProvider()),
        ChangeNotifierProvider(create: (ctx) => VeiculosProvider()),
      ],
      child: MaterialApp(
        title: 'Pestana Parking',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => Home(),
          AppRoutes.PESSOA_LIST: (_) => PessoaList(),
          AppRoutes.PESSOA_FORM: (_) => PessoaForm(),
          AppRoutes.VEICULO_LIST: (_) => VeiculoList(),
          AppRoutes.VEICULO_FORM: (_) => VeiculoForm(),
        },
      ),
    );
  }
}
