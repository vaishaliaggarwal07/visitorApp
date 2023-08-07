import 'package:flutter/material.dart';
import 'package:visitor_application/display_list.dart';
import 'package:visitor_application/visitors_list.dart';

import 'navbar.dart';
import 'visitor.dart';

class VisitorsListPage extends StatefulWidget {
  const VisitorsListPage({super.key});

  @override
  State<VisitorsListPage> createState() => _VisitorsListPageState();
}

class _VisitorsListPageState extends State<VisitorsListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFFF6e5), Color(0xFFF39D23)],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: Navbar(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.transparent,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.cover,
                    // height: 500,
                    width: 180,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   width: 8,
                // ),
                Text(
                  'Visitor List',
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFFFE4C2D),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Divider(
              color: Color(0xFFF39D23),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                      color: Color(0xFF797979),
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Roboto',
                      fontSize: 14)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 50, child: Text('Name')),
                      SizedBox(width: 200, child: Text('Email')),
                      SizedBox(width: 80, child: Text('Date')),
                      SizedBox(width: 50, child: Text('Status')),
                      SizedBox(
                        width: 20,
                      )
                      // Text('Status'),
                    ],
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: visitorsList.length,
              itemBuilder: (context, index) {
                Visitor visitor = visitorsList[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(
                            color: Color.fromRGBO(255, 92, 0, 1),
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Roboto',
                            fontSize: 14),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 50, child: Text(visitor.name)),
                          SizedBox(width: 200, child: Text(visitor.email)),
                          SizedBox(
                              width: 80, child: Text(visitor.dateSelected)),
                          SizedBox(width: 50, child: Text('online')),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}
