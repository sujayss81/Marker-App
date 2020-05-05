import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qr_flutter/qr_flutter.dart';

ProgressDialog pr;
String qr="gg";
String host = '10.0.2.2';
class GenerateQr extends StatefulWidget {
  final Map data;
  GenerateQr({this.data});
  @override
  _GenerateQrState createState() => _GenerateQrState();
}

class _GenerateQrState extends State<GenerateQr> {
  Future<String> getData() async{
    Map data = widget.data;
    Response value = await get('http://$host/generateQR/${data['sub_id']}');
    await Future.delayed(Duration(seconds: 5));
      if(value.statusCode == 200) {
        Response res = value;
        Map d = jsonDecode(res.body);
        qr = d['qr'];
        return qr;
      }
      else{
        print("Something went wrong");
        getData();
        return null;
      }
  }

  @override
  void initState() {
    super.initState();
//    getData();
  }
  @override
  Widget build(BuildContext context) {
    Map data = widget.data;
    getData();
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey[300]
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 100.0,),
              Text("Scan Code To Mark Attendance",
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  color: Colors.red
                ),
              ),
              FutureBuilder(
                future: getData(),
                builder: (context,snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting: return new SpinKitThreeBounce(color: Colors.blue,);
                    default:
                      if (snapshot.hasError)
                        return new SpinKitThreeBounce(color: Colors.blue,);
                      else
                        return new QrImage(
                          data: snapshot.data,
                          version: QrVersions.auto,
                          size: 300.0,
                        );
                  }}
              ),
            ],
          ),
        ),
      );

  }
}
