import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class PostosController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';
  double long1 = -43.2104872;
  double lat1 = -22.951916;

  PostosController() {
    getPosicao();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
    } catch (e) {
      erro = e.toString();
    }

    notifyListeners();
  }

// verificar se esta ativado a localização
  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;
    bool ativado = await Geolocator.isLocationServiceEnabled();
    if (!ativado) {
      return Future.error('Por favor, habilite a localização no smartphone');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Por favor, autorize o acesso a localização');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Por favor, autorize o acesso a localização');
    }

    return await Geolocator.getCurrentPosition();
  }
}
