import 'package:flutter/material.dart';
import 'package:marker/Student/scanner.dart';

String dropVal="Maths";
int subId = 1;
class SelectSub extends StatefulWidget {
  final Map data;
  SelectSub({this.data});

  @override
  _SelectSubState createState() => _SelectSubState();
}

class _SelectSubState extends State<SelectSub> {
  @override
  Widget build(BuildContext context) {
    List<String> subjects = [
      'Maths',
      'Physics',
      'Chemistry',
      'Computer'
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Select Subject"),
            DropdownButton(
              value: dropVal,
              items: subjects.map((String it){
                return DropdownMenuItem(
                  value: it,
                  child: Text(it),
                );
              }).toList(),
              onChanged: (String str){
                setState(() {
                  switch(str){
                    case 'Maths' : subId = 1;
                                    break;
                    case 'Physics' : subId = 2;
                                    break;
                    case 'Chemistry' : subId = 3;
                                    break;
                    case 'Computer' : subId = 4;
                                    break;
                  }
                  dropVal = str;
                });
              },
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Scanner(id:subId,usn: int.parse(widget.data['usn']),)
                ));
              },
              color: Colors.blueAccent,
              child: Text("Open Scanner",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
