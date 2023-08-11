import 'package:flutter/material.dart';
import 'package:visitor_application/visitor.dart';
import 'package:visitor_application/visitors_list.dart';

class DisplayList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: visitorsList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Scaffold(
            body: ListTile(
              leading: Text('Serial No'),
              title: Container(
                color: Color(0xFFFFFFFF),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text('Name'), Text('Email'), Text('Date')],
                ),
              ),
            ),
          );
        } else {
          int serialNumber = index;
          Visitor visitor = visitorsList[index - 1];
          return ListTile(
            leading: Text('$serialNumber'),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(visitor.name),
                Text(visitor.email),
                Text(visitor.name)
              ],
            ),
          );
        }
      },
    );
  }
}
