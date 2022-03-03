import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        //  String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //      '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        //const barcodeScanRes = 'https://fernando-herrera.com';
        const barcodeScanRes = 'geo:40.993148,-73.665369';
        //print(barcodeScanRes);

        //EL USUARIO CANCELO!...click Cancel button
        if (barcodeScanRes == '-1') {
          return;
        }

        //la insercion
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        //scanListProvider.nuevoScan('geo:15.33,15.66');

        launchURL(context, nuevoScan);
      },
    );
  }
}
