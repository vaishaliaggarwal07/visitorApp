import 'package:flutter/material.dart';
import 'package:visitor_application/form.dart';
import 'package:visitor_application/navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(1, 255, 246, 229)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF6E5),
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
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(100),
      //   child: AppBar(
      //     backgroundColor: Colors.blue,
      //     title: SizedBox(
      //       height: 100,
      //       child: Padding(
      //         padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
      //         child: Image.asset('assets/logo.png', fit: BoxFit.cover),
      //       ),
      //     ),
      //     centerTitle: true,
      //   ),
      // ),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 100,
          ),
          Text(
            'Welcome to Metaorange',
            style: TextStyle(
                color: Color(0xFFFE4C2D),
                fontSize: 30,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 50,
          ),
          IconButton(
            icon: Image.asset(
              'assets/signin.png',
              height: 100,
            ),
            iconSize: 5,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
              );
            },
          ),

          // Image.asset(
          //   'assets/signin.png',
          //   height: 100,
          // ),
        ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

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
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () => {},
                  child: Text(
                    'New Visitor',
                    style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFFFE4C2D),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  'Registered Visitor',
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF8E8E8E),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
            Divider(
              color: Color(0xFFF39D23),
            ),
            MyCustomForm(),
          ]),
        ),
      ),
    );
  }
}
