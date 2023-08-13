import 'package:flutter/material.dart';
import 'package:visitor_application/editInfo.dart';
import 'package:visitor_application/thank_you.dart';
import 'package:http/http.dart' as http;
import 'navbar.dart';
import 'visitor.dart';
import 'package:intl/intl.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class VisitorsInfo extends StatefulWidget {
  Visitor visitor;

  VisitorsInfo({required this.visitor});

  @override
  State<VisitorsInfo> createState() => _VisitorsInfoState();
}

class _VisitorsInfoState extends State<VisitorsInfo> {
  bool _isCheckedOut = false;

  Future<void> checkOutVisitor(int visitorId) async {
    final apiUrl = Uri.parse('http://localhost:3000/check_out?id=$visitorId');
    final response = await http.patch(apiUrl);

    if (response.statusCode == 200) {
      print('Visitor checked out successfully');
      // Update the _isCheckedOut state here if needed
    } else {
      print('Error checking out visitor');
    }
  }

  Future<void> _handleCheckOut() async {
    if (!_isCheckedOut) {
      await checkOutVisitor(
          widget.visitor.id); // Update visitor status in the database
      setState(() {
        _isCheckedOut = true;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ThankYou()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Color statusColor = _isCheckedOut ? Colors.red : Colors.green;
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
                  'Visitor Info',
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
            SizedBox(
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100,
                          child: Text(
                            'Name',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400),
                          )),
                      SizedBox(
                          width: 170,
                          child: Text(
                            widget.visitor.visitor_name,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFF2600)),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100,
                          child: Text(
                            'Organization',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400),
                          )),
                      SizedBox(
                          width: 170,
                          child: Text(
                            widget.visitor.visitor_organization,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFF2600)),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100,
                          child: Text(
                            'Email',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400),
                          )),
                      SizedBox(
                          width: 170,
                          child: Text(
                            widget.visitor.visitor_email,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFF2600)),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100,
                          child: Text(
                            'Mobile No.',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400),
                          )),
                      SizedBox(
                          width: 170,
                          child: Text(
                            widget.visitor.visitor_phone_number,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFF2600)),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100,
                          child: Text(
                            'Meet with',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400),
                          )),
                      SizedBox(
                          width: 170,
                          child: Text(
                            widget.visitor.visitor_whom_meet,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFF2600)),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100,
                          child: Text(
                            'Date',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400),
                          )),
                      SizedBox(
                          width: 170,
                          child: Text(
                            widget.visitor.visit_date,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFF2600)),
                          ))
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            'Status',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 170,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: statusColor,
                          ),
                        ),
                      ]),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                            onPressed: _handleCheckOut,
                            icon: Icon(
                              // <-- Icon
                              Icons.outbond_outlined,
                              size: 17.0,
                              color: Color(0xFFFE4C2D),
                            ),
                            label: Text(
                              _isCheckedOut ? 'Checked Out' : 'Check Out',
                              style: TextStyle(
                                  color: Color(0xFFFE4C2D),
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                  width: 1.0, color: Color(0xFFFF5C00)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ) // <-- Text
                            ),
                        ElevatedButton.icon(
                            onPressed: () async {
                              final updatedVisitor = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditVisitor(
                                            visitor: widget.visitor,
                                          )));
                              if (updatedVisitor != null) {
                                setState(() {
                                  widget.visitor = updatedVisitor;
                                });
                              }
                            },
                            icon: Icon(
                              // <-- Icon
                              Icons.edit,
                              size: 17.0,
                              color: Color(0xFFFE4C2D),
                            ),
                            label: Text(
                              'Edit',
                              style: TextStyle(
                                  color: Color(0xFFFE4C2D),
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                  width: 1.0, color: Color(0xFFFF5C00)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ) // <-- Text
                            ),
                        ElevatedButton.icon(
                            onPressed: () async {
                              final response = await http.patch(
                                Uri.parse(
                                    'http://localhost:3000/delete_visitor'),
                                body: {'id': widget.visitor.id.toString()},
                              );
                              if (response.statusCode == 200) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ThankYou(),
                                  ),
                                );
                              } else {
                                print('Error deleting visitor');
                              }
                            },
                            icon: Icon(
                              // <-- Icon
                              Icons.delete,
                              size: 17.0,
                              color: Color(0xFFFE4C2D),
                            ),
                            label: Text(
                              'Delete',
                              style: TextStyle(
                                  color: Color(0xFFFE4C2D),
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                  width: 1.0, color: Color(0xFFFF5C00)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ) // <-- Text
                            ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
