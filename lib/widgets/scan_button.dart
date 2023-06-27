import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:jogo_mobile_app/services/qr.service.dart';
import 'package:jogo_mobile_app/widgets/failed_modal.dart';
import 'package:jogo_mobile_app/widgets/success_modal.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.qr_code_2_outlined),
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#31dc77', 'Cancelar', false, ScanMode.QR);

          createQR(context, barcodeScanRes);
        });
  }

  Future<void> createQR(context, barcodeScanRes) async {
    if (barcodeScanRes != "") {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Verificando...',
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3)));

      Response response = await QrService().search(context, barcodeScanRes);
      dynamic res = response.data;

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res['ErrorCode'] == null && res["success"] != "") {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const SuccessModal(
              title: 'Verificación correcta',
              description: 'Se ha verificado que el QR scaneado es válido. ',
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const FailedModal(
              title: 'Verificación incorrecta',
              description:
                  'Se ha encontrado que el QR scaneado es inválido. Por favor, verifique que sea el QR correcto e intente de nuevo.',
            );
          },
        );
      }
    }
  }
}
