import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        SizedBox(
          height: 20,
        ),
        Image.asset(
          'assets/logo.png',
          height: 40,
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Color(0xFFF39D23),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'New Visitor',
                  style: TextStyle(
                    color: Color(0xFFFE4C2D),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              ),
              Divider(
                color: Color(0xFFF39D23),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Host Visitor',
                  style: TextStyle(
                    color: Color(0xFFFE4C2D),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              ),
              Divider(
                color: Color(0xFFF39D23),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Planned Visitor',
                  style: TextStyle(
                    color: Color(0xFFFE4C2D),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              ),
              Divider(
                color: Color(0xFFF39D23),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Visitor List',
                  style: TextStyle(
                    color: Color(0xFFFE4C2D),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              ),
              Divider(
                color: Color(0xFFF39D23),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Check Out',
                  style: TextStyle(
                    color: Color(0xFFFE4C2D),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              ),
              Divider(
                color: Color(0xFFF39D23),
              ),
            ],
          ),
        )
      ]),
    );
  }
}