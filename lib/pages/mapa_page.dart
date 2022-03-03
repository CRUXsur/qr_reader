import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:qr_reader/providers/db_provider.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    //! recibo lo que estoy mandando como argumento del navigator pushNamed!
    //? HACER UN CASTING:
    //* final ScanModel scan = ModalRoute.of(context)!.settings.arguments
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition puntoInicial = CameraPosition(
      //target: LatLng(37.42796133580664, -122.085749655962),
      target: scan.getLatLng(),
      zoom: 17.5,
      tilt: 50, //grado de inclinacion
    );

    //Marcadores
    Set<Marker> markers = new Set<Marker>();
    markers.add(
      Marker(
        markerId: const MarkerId('geo-location'),
        position: scan.getLatLng(),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        //* tipo de mapa satelital(.hybrid), etc....
        mapType: MapType.normal,
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
