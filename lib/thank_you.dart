import 'package:flutter/material.dart';

import 'package:visitor_application/navbar.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

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
                  // SizedBox(
                  //   height: 50,
                  // ),
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
                  child: Image.asset(
                    'thankyou.png',
                    height: 100,
                  ),
                ),
                Text(
                  'Thank you for visiting us',
                  style: TextStyle(
                      color: Color(0xFFFE4C2D),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'You are checking out at',
                  style: TextStyle(
                      color: Color(0xFFFE4C2D),
                      fontSize: 30,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )),
    );
  }
}
