import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapaGoogle extends StatelessWidget {
  const mapaGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa Google'),
      ),
      body: const GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-22.951916, -43.2104872),
          zoom: 18,
        ),
        zoomControlsEnabled: true,
        mapType: MapType.satellite,
      ),
    );
  }
}
