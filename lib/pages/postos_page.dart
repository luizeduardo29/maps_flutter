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
        leading: Icon(Icons.location_pin),
        title: Text('Postos Proximos'),
      ),
      body: ChangeNotifierProvider<PostosController>(
        create: (context) => PostosController(),
        child: Builder(builder: (context) {
          final local = context.watch<PostosController>();

          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(local.latFix, local.longFix),
              //trocar para lat e long se o emulador conseguir puxar a localização do smartphone
              zoom: 17,
            ),
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            myLocationEnabled: true,
            onMapCreated: local.onMapCreated,
            markers: local.markers,
          );
        }),
      ),
    );
  }
}
