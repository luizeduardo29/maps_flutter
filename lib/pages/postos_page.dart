import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../controller/postos_controller.dart';

final appKey = GlobalKey();

class PostosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appKey,
      appBar: AppBar(
        title: Text('Minha Localização'),
      ),
      body: ChangeNotifierProvider<PostosController>(
        create: (context) => PostosController(),
        child: Builder(builder: (context) {
          final local = context.watch<PostosController>();

          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(local.lat1, local.long1),
              zoom: 18,
            ),
            zoomControlsEnabled: true,
            mapType: MapType.satellite,
            myLocationEnabled: true,
          );
        }),
      ),
    );
  }
}
