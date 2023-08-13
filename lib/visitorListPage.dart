import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:visitor_application/visitorInfo.dart';
import 'package:visitor_application/visitors_list.dart';

import 'navbar.dart';
import 'visitor.dart';
import 'package:http/http.dart' as http;

class VisitorsListPage extends StatefulWidget {
  const VisitorsListPage({super.key});

  @override
  State<VisitorsListPage> createState() => _VisitorsListPageState();
}

class _VisitorsListPageState extends State<VisitorsListPage> {
  Future<List<Visitor>>? _visitorsFuture;
  @override
  void initState() {
    super.initState();
    _visitorsFuture = fetchVisitors();
  }

  Future<List<Visitor>> fetchVisitors() async {
    final apiUrl = Uri.parse('http://localhost:3000/all_visitor');
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      List<Visitor> updatedList =
          jsonData.map((item) => Visitor.fromJson(item)).toList();
      return updatedList;
    } else {
      throw Exception('Error fetching visitors from the server.');
    }
  }

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
          body: SingleChildScrollView(
            child: FutureBuilder<List<Visitor>>(
              future: _visitorsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Display loading indicator
                } else if (snapshot.hasError) {
                  return Text(
                      'Error loading visitors data'); // Display error message
                } else if (snapshot.hasData) {
                  List<Visitor> visitorsList = snapshot.data!;

                  return Column(children: [
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
                      padding: const EdgeInsets.fromLTRB(30, 40, 30, 4),
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(
                                  color: Color(0xFF7E7E7E),
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto',
                                  fontSize: 13)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // SizedBox(width: 10, child: Text('id')),
                              SizedBox(
                                width: 50,
                                child: Text('Name',
                                    style: TextStyle(color: Color(0xFF7E7E7E))),
                              ),
                              SizedBox(
                                  width: 200,
                                  child: Text('Email',
                                      style:
                                          TextStyle(color: Color(0xFF7E7E7E)))),
                              SizedBox(
                                  width: 80,
                                  child: Text('Date',
                                      style:
                                          TextStyle(color: Color(0xFF7E7E7E)))),
                              SizedBox(
                                  width: 40,
                                  child: Text('Status',
                                      style:
                                          TextStyle(color: Color(0xFF7E7E7E)))),
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
                        Color statusColor =
                            visitor.status_visitor ? Colors.green : Colors.red;

                        DateTime visitDate = DateTime.parse(
                            visitor.visit_date); // Parse the date string
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(visitDate);
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 4),
                          child: TextButton(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VisitorsInfo(
                                    visitor: visitor,
                                  ),
                                ),
                              );
                              initState();
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                TextStyle(
                                    color: Color.fromRGBO(255, 92, 0, 1),
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Roboto',
                                    fontSize: 13),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // SizedBox(
                                  //     width: 10,
                                  //     child: Text(visitor.id.toString())),
                                  SizedBox(
                                      width: 50,
                                      child: Text(
                                        visitor.visitor_name,
                                        style:
                                            TextStyle(color: Color(0xFFFE4C2D)),
                                      )),
                                  SizedBox(
                                      width: 200,
                                      child: Text(visitor.visitor_email,
                                          style: TextStyle(
                                              color: Color(0xFFFE4C2D)))),
                                  SizedBox(
                                      width: 80,
                                      child: Text(formattedDate,
                                          style: TextStyle(
                                              color: Color(0xFFFE4C2D)))),
                                  SizedBox(
                                      width: 40,
                                      child: CircleAvatar(
                                        radius: 3,
                                        backgroundColor: statusColor,
                                      )),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(1, 0, 2, 0),
                                    child: SizedBox(
                                      width: 8,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                          size: 15.0,
                                          color: Color(0xFFFE4C2D),
                                        ),
                                        tooltip: 'Edit',
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(1, 0, 2, 0),
                                    child: SizedBox(
                                      width: 8,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          size: 15.0,
                                          color: Color(0xFFFE4C2D),
                                        ),
                                        tooltip: 'Delete',
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ]);
                } else {
                  return Text('no visitors data available');
                }
              },
            ),
          ),
        ));
  }
}
