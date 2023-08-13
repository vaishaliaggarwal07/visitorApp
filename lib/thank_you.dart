import 'dart:async';

import 'package:flutter/material.dart';
import 'package:visitor_application/navbar.dart';

class ThankYou extends StatefulWidget {
  ThankYou({Key? key}) : super(key: key);
  // const ThankYou({super.key});

  @override
  State<ThankYou> createState() => _ThankYouState();
}

class _ThankYouState extends State<ThankYou> {
  late DateTime checkoutTime;
  late Timer timer;
  @override
  // void initStae() {
  //   super.initState();
  //   checkoutTime = DateTime.now();
  //   timer = Timer.periodic(Duration(minutes: 1), (Timer t) {
  //     setState(() {
  //       checkoutTime = DateTime.now();
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   timer.cancel();
  //   super.dispose();
  // }

  // @override
  Widget build(BuildContext context) {
    // String hourMinute = DateFormat('hh:mm').format(checkoutTime);
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
                  padding: const EdgeInsets.fromLTRB(15, 90, 15, 15),
                  child: Image.asset(
                    'thankyou.png',
                    height: 200,
                  ),
                ),
                Text(
                  'Thank you for visiting us',
                  style: TextStyle(
                      color: Color(0xFFFE4C2D),
                      fontSize: 26,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'You are checking out at ',
                    style: TextStyle(
                        color: Color(0xFFFE4C2D),
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
