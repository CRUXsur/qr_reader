import 'package:flutter/material.dart';

import 'package:qr_reader/providers/db_provider.dart';

class MapaPage extends StatelessWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! recibo lo que estoy mandando como argumento del navigator pushNamed!
    //? HACER UN CASTING:
    //* final ScanModel scan = ModalRoute.of(context)!.settings.arguments
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: Center(
        child: Text(scan.valor),
      ),
    );
  }
}
