// import 'package:barcode_scanner/barcode_scanning_data.dart';
// import 'package:barcode_scanner/common_data.dart';
// import 'package:barcode_scanner/scanbot_barcode_sdk.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:qrscan/qrscan.dart' as scanner;

class QrcodePage extends StatefulWidget {
  @override
  _QrcodePageState createState() => _QrcodePageState();
}

class _QrcodePageState extends State<QrcodePage> {
  String barcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("二维码"),
        ),
        body: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {scan();},
              child: Text('扫码'),
            ),
            new QrImage(
              data: '这是生成的二维码数据',
              size: 200.0,
            ),
          ],
        )));
  }

  Future scan() async {
    try {
      String barcode = await scanner.scan();
      showAlertDialog(context, barcode);
      setState(() => this.barcode = barcode);
    } on Exception catch (e) {
      // ignore: unrelated_type_equality_checks
      if (e == scanner.CameraAccessDenied) {
        setState(() {
          this.barcode = '没有拍照权限!';
        });
      } else {
        setState(() => this.barcode = '未知错误: $e');
        print(e);
      }
    }
  }

  // startBarcodeScanner({bool shouldSnapImage = false}) async {
  //   if (!await checkLicenseStatus(context)) {
  //     return;
  //   }
  //
  //   var config = BarcodeScannerConfiguration(
  //     barcodeImageGenerationType: shouldSnapImage
  //         ? BarcodeImageGenerationType.VIDEO_FRAME
  //         : BarcodeImageGenerationType.NONE,
  //     topBarBackgroundColor: Colors.blueAccent,
  //     finderLineColor: Colors.red,
  //     cancelButtonTitle: "Cancel",
  //     finderTextHint:
  //         "Please align any supported barcode in the frame to scan it.",
  //     successBeepEnabled: true,
  //     barcodeFormats: barcodeFormatsRepository.selectedFormats.toList(),
  //     // see further customization configs ...
  //   );
  //
  //   try {
  //     var result = await ScanbotBarcodeSdk.startBarcodeScanner(config);
  //
  //     if (result.operationResult == OperationResult.SUCCESS) {
  //       // Navigator.of(context).push(
  //       //   // MaterialPageRoute(
  //       //   //     builder: (context) => BarcodesResultPreviewWidget(result)),
  //       // );
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<bool> checkLicenseStatus(BuildContext context) async {
  //   var result = await ScanbotBarcodeSdk.getLicenseStatus();
  //   if (result.isLicenseValid) {
  //     return true;
  //   }
  //   await showAlertDialog(
  //       context, 'Scanbot SDK trial period or (trial) license has expired.',
  //       title: 'Info');
  //   return false;
  // }

  Future<void> showAlertDialog(BuildContext context, String textToShow,
      {String title}) async {
    Widget text = SimpleDialogOption(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(textToShow),
      ),
    );

    // set up the SimpleDialog
    AlertDialog dialog = AlertDialog(
      title: title != null ? Text(title) : null,
      content: text,
      contentPadding: EdgeInsets.all(0),
      actions: <Widget>[
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    // show the dialog
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}
