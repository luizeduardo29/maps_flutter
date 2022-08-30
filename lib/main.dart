import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:maps_flutter/pages/postos_page.dart';
import 'package:maps_flutter/pages/teste.dart'; //pagina para fazer os testes
import 'package:maps_flutter/repositories/postos_repositories.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  runApp(ChangeNotifierProvider<PostosRepository>(
    create: (_) => PostosRepository(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Postos Proximos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostosPage(),
    );
  }
}
