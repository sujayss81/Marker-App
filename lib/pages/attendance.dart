import 'package:flutter/material.dart';
import 'package:marker/pages/preabs.dart';

class Attendance extends StatefulWidget {
  final Map data;
  final int subId;
  Attendance({this.subId,this.data});
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("View Attendance Details"),
            RaisedButton(
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2021)
                ).then((d){
                  String date = d.toString().substring(0,10);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ShowAttendance(date: date,data: widget.data,)
                  ));
                });
              },
              child: Text("Pick Date",
              style: TextStyle(
                color: Colors.white,
              ),
              ),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
