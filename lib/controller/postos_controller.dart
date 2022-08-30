import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_flutter/pages/postos_page.dart';
import 'package:maps_flutter/repositories/postos_repositories.dart';
import 'package:maps_flutter/widgets/posto_detalhe.dart';

class PostosController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';
  double longFix = -43.2104872;
  double latFix = -22.951916;
  Set<Marker> markers = Set<Marker>();
  late GoogleMapController _mapsController;

  /*PostosController() {
    getPosicao();
  }*/

  get mapsController => _mapsController;

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    getPosicao();
    loadPostos();
  }

  //chamando os postos, poderia ser uma chamada a uma api ou banco de dados
  loadPostos() {
    final postos = PostosRepository().postos;
    postos.forEach((posto) async {
      markers.add(
        Marker(
          markerId: MarkerId(posto.nome),
          position: LatLng(posto.latitude, posto.longitude),
          icon: await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(),
            'images/posto.png',
          ),
          onTap: () => {
            showModalBottomSheet(
              context: appKey.currentState!.context,
              builder: (context) => PostoDetalhes(posto: posto),
            )
          },
        ),
      );
    });
    notifyListeners();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
      _mapsController //lat é para localização em tempo real e lat1 é para uma fixa criada
          .animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
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
