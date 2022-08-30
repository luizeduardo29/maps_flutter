import 'package:flutter/cupertino.dart';

import '../model/posto.dart';

class PostosRepository extends ChangeNotifier {
  final List<Posto> _postos = [
    Posto(
      nome: 'Posto GT - Rede Rodoil',
      endereco: 'R. João Negrão, 1072 - Rebouças - Centro, Curitiba - PR',
      foto:
          'https://lh5.googleusercontent.com/p/AF1QipP_xnSi5-sp9slSuMpSx-JlmvwvHGL1VJ_JcOGX=w408-h306-k-no',
      latitude: -22.8548194,
      longitude: -43.3052476,
    ),
    Posto(
      nome: 'Auto Posto Rodoviária',
      endereco: 'Av. Presidente Affonso Camargo 10 - Rebouças, Curitiba - PR',
      foto:
          'https://lh5.googleusercontent.com/p/AF1QipPnfQSsnvt6-VAxF-fUQ0onQCeRktJptOvSL_9F=w408-h306-k-no',
      latitude: -22.8548347,
      longitude: -43.3071987,
    ),
    Posto(
      nome: 'Auto Posto Nilo Cairo',
      endereco: 'R. Tibagi, 652 - Centro, Curitiba - PR',
      foto:
          'https://lh5.googleusercontent.com/p/AF1QipOB2w7C9Q_NTblNRhcxJtN3-s4_gSjHI1rs5cSM=w408-h544-k-no',
      latitude: -22.8546618,
      longitude: -43.3062431,
    ),
  ];

  List<Posto> get postos => _postos;
}
