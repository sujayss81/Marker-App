import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../constants.dart';

ProgressDialog pr;
String qr="gg";
String host = HOST;
class GenerateQr extends StatefulWidget {
  final Map data;
  GenerateQr({this.data});
  @override
  _GenerateQrState createState() => _GenerateQrState();
}

class _GenerateQrState extends State<GenerateQr> {
  Future<String> getData() async{
    Map data = widget.data;
    Response value = await get(Uri.https(host, '/generateQR/${data['sub_id']}'));
    await Future.delayed(Duration(seconds: 5));
      if(value.statusCode == 200) {
        Response res = value;
        Map d = jsonDecode(res.body);
        qr = d['qr'];
        return qr;
      }
      else{
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
    var ht = MediaQuery.of(context).size.height;
    getData();
    return Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: ht * 0.1,),
              Text("Scan Code To Mark Attendance",
                style: TextStyle(
                  fontSize: ht * 0.03,
                  letterSpacing: 1.0,
                  color: Theme.of(context).primaryColor
                ),
              ),SizedBox(height: ht * 0.03,),
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
                          backgroundColor: Colors.white,
                          data: snapshot.data,
                          size: ht * 0.5,
                        );
                  }}
              ),
            ],
          ),
        ),
      );

  }
}
