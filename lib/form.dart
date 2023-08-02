import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(60, 10, 60, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 9, 7, 5),
              child: Text(
                'Visitor Name',
                style: TextStyle(
                    color: Color(0xFFF39D23),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xFF797979),
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(15, 25, 25, 0),
                  // labelText: 'Enter Name',
                  hintText: 'Enter Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 9, 7, 5),
              child: Text(
                'Visitor Organization',
                style: TextStyle(
                    color: Color(0xFFF39D23),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xFF797979),
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(15, 25, 25, 0),
                  // labelText: 'Enter Name',
                  hintText: 'Please enter organization',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 9, 7, 5),
              child: Text(
                'Here to meet?',
                style: TextStyle(
                    color: Color(0xFFF39D23),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xFF797979),
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(15, 25, 25, 0),
                  // labelText: 'Enter Name',
                  hintText: 'Please enter person name whom you want to meet',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 9, 7, 5),
              child: Text(
                'Visitor Email ID',
                style: TextStyle(
                    color: Color(0xFFF39D23),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xFF797979),
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(15, 25, 25, 0),
                  // labelText: 'Enter Name',
                  hintText: 'Please enter email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 9, 7, 5),
              child: Text(
                'Visitor Contact number',
                style: TextStyle(
                    color: Color(0xFFF39D23),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xFF797979),
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(15, 25, 25, 0),
                  // labelText: 'Enter Name',
                  hintText: 'Please enter mobile number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 9, 7, 5),
              child: Text(
                'Visiting Purpose',
                style: TextStyle(
                    color: Color(0xFFF39D23),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xFF797979),
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(15, 25, 25, 0),
                  // labelText: 'Enter Name',
                  hintText: 'Please enter visiting purpose',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
