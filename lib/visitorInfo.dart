import 'package:flutter/material.dart';
import 'package:visitor_application/thank_you.dart';

import 'navbar.dart';
import 'visitor.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class VisitorsInfo extends StatelessWidget {
  final Visitor visitor;

  VisitorsInfo({required this.visitor});

//   Future<void> editVisitorInfo(Visitor updatedVisitor) async {
//   final apiUrl = 'http://localhost:3000/edit-visitor/${updatedVisitor.id}'; // Replace with your server's URL

//   final response = await http.put(
//     Uri.parse(apiUrl),
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode(updatedVisitor.toJson()),
//   );

//   if (response.statusCode == 200) {
//     // API call was successful, handle success scenario
//   } else {
//     // Handle API call error
//   }
// }

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
                            visitor.name,
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
                            visitor.organization,
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
                            visitor.email,
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
                            visitor.phone_number,
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
                            visitor.whom_meet,
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
                            '08/08/2023',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFF2600)),
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ThankYou()));
                            },
                            icon: Icon(
                              // <-- Icon
                              Icons.outbond_outlined,
                              size: 17.0,
                              color: Color(0xFFFE4C2D),
                            ),
                            label: Text(
                              'Check out',
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
                            onPressed: () {},
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
                            onPressed: () {},
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
