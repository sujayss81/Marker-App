import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'loginLoad.dart';

class ShowAttendance extends StatefulWidget {
  final Map data;
  final String date;
  ShowAttendance({this.date,this.data});
  @override
  _ShowAttendanceState createState() => _ShowAttendanceState();
}

class _ShowAttendanceState extends State<ShowAttendance> {
  List<String> usn =[];
  List<int> flag = [];
  Future<List> getPresent() async{
    Response response;
    var obj;
    response = await get("http://$host/absent/${widget.date}/${widget.data['sub_id']}");
    if(response.body != "") {
      obj = jsonDecode(response.body);
    }
    List<dynamic> user = [];
    if(obj != null) {
      for (var i in obj) {
        user.add(i['name']);
        usn.add(i['usn']);
        flag.add(0);
      }
    }
    response = await get("http://$host/present/${widget.date}/${widget.data['sub_id']}");
    obj = jsonDecode(response.body);
    if(obj != null) {
      for (var i in obj) {
        user.add(i['stud_name']);
        usn.add(i['usn']);
        flag.add(1);
      }
    }
    return user;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Marker"),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future: getPresent(),
          builder: (context,snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting: return Text("Loading");
              default :
                if(snapshot.hasError){
                  return Text("Server Error");
                }
                else{
                  List<dynamic> students = snapshot.data;
                  return ListView.builder(
                    itemCount: students.length,
                      itemBuilder: (context, index){
                        if(flag[index] == 1){
                          return Card(
                            child: ListTile(
                              onTap: () {},
                              title: Text("Name: ${students[index]}"),
                              subtitle: Text("USN: ${usn[index]}"),
                              trailing: Text(
                                  "Present",
                                style: TextStyle(
                                  color: Colors.green
                              ),
                              ),
                            ),
                          );
                        }
                        else{
                          return Card(
                            child: ListTile(
                              onTap: () {},
                              title: Text("Name: ${students[index]}"),
                              subtitle: Text("USN: ${usn[index]}"),
                              trailing: Text(
                                  "Absent",
                                  style: TextStyle(
                                  color: Colors.red
                                ),
                              ),
                            ),
                          );
                        }

                      }
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
