import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';
import 'package:http/http.dart';

String host = '34.93.94.220';
int flag = 0;
class Scanner extends StatefulWidget {
  final int id;
  final int usn;
  Scanner({this.id,this.usn});
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String qrText;
  final GlobalKey qrKey = GlobalKey();
  QRViewController controller;

  showAlertDialog(BuildContext context,String message){
    var alert = AlertDialog(
      title: Text("Scanner"),
      content: Text(message),
      actions: <Widget>[
        FlatButton(
          child: Text("OK"),
          onPressed: () {
            int count = 0;
            Navigator.of(context).popUntil((_) => count++ > 1);
          },
        )
      ],
    );

    showDialog(
      context: context,
      builder: (context) {
        return alert;
      }

    );
  }

  Future<void> sendData() async{
    Response resp = await get("http://$host/attendence/${widget.usn}/${widget.id}/$qrText");
    int res = resp.statusCode;
    if(res == 200){
      showAlertDialog(context, "Attendance Marked Successfully");
    }
    else if(res == 409){
      showAlertDialog(context, "You have already Marked your attendance");
    }
    else if(res == 404){
      showAlertDialog(context, "Please Scan Correct QR Code");
    }
    else{
      showAlertDialog(context, "Server Error");
    }
  }

  void _onQrViewCreated(QRViewController controller){
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async{
        if(flag == 0) {
          flag = 1;
          qrText = scanData;
          await sendData();
        }
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flag = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
          key: qrKey,
          onQRViewCreated: _onQrViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: Colors.red,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: 300,
          ),
      ),
    );
  }
}
