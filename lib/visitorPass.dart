import 'dart:html';

import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:visitor_application/main.dart';
import 'package:visitor_application/navbar.dart';
import 'package:visitor_application/visitor.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:typed_data';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class VisitorPass extends StatefulWidget {
  final Visitor visitor;
  VisitorPass({required this.visitor});

  @override
  State<VisitorPass> createState() => _VisitorPassState();
}

class _VisitorPassState extends State<VisitorPass> {
  late final PdfImage pdfImage;
  Uint8List? visitorImageBytes;
  @override
  void initState() {
    super.initState();
    _fetchVisitorImage(widget.visitor.image_url);
  }

  Future<void> _fetchVisitorImage(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        setState(() {
          visitorImageBytes = response.bodyBytes;
        });
      } else {
        print('Failed to fetch visitor image.');
      }
    } catch (error) {
      print('Error fetching visitor image: $error');
    }
  }

  // const ThankYou({super.key});
  Future<void> _printVisitorPass() async {
    if (visitorImageBytes == null) {
      print('Visitor image not fetched yet.');
      return;
    }

    final pdf = pw.Document();

    pdf.addPage(pw.Page(build: (pw.Context context) {
      return pw.Center(
          child: pw.Container(
              color: PdfColor.fromHex('#FFB449'),
              child: pw.Row(children: [
                pw.Expanded(
                    flex: 1,
                    child: pw.Padding(
                        padding: pw.EdgeInsets.all(10),
                        child: pw.Image(PdfImage(pdf.document,
                            image: visitorImageBytes!,
                            width: 60,
                            height: 60) as pw.ImageProvider))),
                // pw.Expanded(
                //   flex: 1,
                //   child: pw.Padding(
                //     padding: pw.EdgeInsets.all(10),
                //     child: SizedBox(
                //       width: 60,
                //       height: 60,
                //       child: BarcodeWidget(
                //         barcode: Barcode.qrCode(),
                //         data: 'Visitor Info: ${widget.visitor.toJson().toString()}',
                //         width: 60,
                //         height: 60,
                //       ),
                //     )
                //   )
                // )
              ])));
    }));
    //   final pdfBytes = pdf.save();
    //   final blob = html.Blob([pdfBytes]);
    //   final url = html.Url.createObjectUrlFromBlob(blob);
    //     final pdfIframe = '<iframe src="$url" width="100%" height="100%"></iframe>';
    // final newWindow = html.window.open('', '_blank');
    // newWindow.document.write(pdfIframe);
    //   html.window.open(url, '_blank');
    // final anchor = html.AnchorElement(href: url)
    //   ..target = 'blank'
    //   ..click();

    // html.Url.revokeObjectUrl(url);
    // final output = await Printing.convertHtml(
    //   format: PrintingFormat.android,
    //   html: pdf.save(),
    // );

    // await Printing.directPrintPdf(
    //   format: PrintingFormat.android,
    //   // printer: // Replace with your printer name
    //   onLayout: (PdfPageFormat format) => output, printer: ,
    // );

    await Printing.layoutPdf(onLayout: (format) => pdf.save());
  }

  void _printVisitorPassWeb() {
    final content = '''
<div style = "wdith:400px; height: 200px; background-color:#FFB449;">
<div>
          <img src="${widget.visitor.image_url}" alt="Visitor Image" width="60" height="60">
          <div>
            <span>Name: ${widget.visitor.visitor_name}</span><br>
            <span>Organization: ${widget.visitor.visitor_organization}</span><br>
            <span>Email: ${widget.visitor.visitor_email}</span><br>
            <span>Mobile No.: ${widget.visitor.visitor_phone_number}</span><br>
            <span>Here to meet: ${widget.visitor.visitor_whom_meet}</span><br>
          </div>
        </div>
      </div>
      ''';

    final html = '''
      <!DOCTYPE html>
      <html>
      <head>
        <title>Visitor Pass</title>
      </head>
      <body>
        $content
        <script>
          function printContent() {
            window.print();
          }
          printContent();
        </script>
      </body>
      </html>
    ''';

    final blob = Blob([html]);
    final url = Url.createObjectUrlFromBlob(blob);
    final anchor = AnchorElement(href: url)
      ..target = 'blank'
      ..click();

    Url.revokeObjectUrl(url);
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
            title:
                // SizedBox(
                //   height: 50,
                // ),
                Padding(
              padding: const EdgeInsets.fromLTRB(85, 20, 0, 0),
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
                // height: 500,
                width: 180,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'New Visitor',
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
                  height: 50,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Container(
                      width: 420,
                      height: 230,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Card(
                          color: Color(0xFFFFB449),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: Color(0xFFC8102E),
                                width: 1.0,
                              )),
                          child: Row(
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.all(10.0),
                              //   child: ClipRRect(
                              //     borderRadius: BorderRadius.circular(10),
                              //     child: Image.network(
                              //       visitor.image_url,
                              //       width: 100,
                              //       height: 130,
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 8, 0),
                                child: CircleAvatar(
                                  radius: 65,
                                  backgroundImage:
                                      NetworkImage(widget.visitor.image_url),
                                ),
                              ),

                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 40, 20, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Name: ',
                                            style:
                                                TextStyle(fontFamily: 'Roboto'),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${widget.visitor.visitor_name}',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Color(0xFFC8102E)),
                                          )
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Oragnization: ',
                                            style:
                                                TextStyle(fontFamily: 'Roboto'),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${widget.visitor.visitor_organization}',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Color(0xFFC8102E)),
                                          )
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Email: ',
                                            style:
                                                TextStyle(fontFamily: 'Roboto'),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '${widget.visitor.visitor_email}',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Color(0xFFC8102E)),
                                          )
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Mobile no.: ',
                                            style:
                                                TextStyle(fontFamily: 'Roboto'),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${widget.visitor.visitor_phone_number}',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Color(0xFFC8102E)),
                                          )
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Here to meet: ',
                                            style:
                                                TextStyle(fontFamily: 'Roboto'),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${widget.visitor.visitor_whom_meet}',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Color(0xFFC8102E)),
                                          )
                                        ],
                                      ),
                                      // Text(
                                      //     'Organization: ${widget.visitor.visitor_organization}'),
                                      // Text('Email: ${widget.visitor.visitor_email}'),
                                      // Text(
                                      //     'Mobile No.: ${widget.visitor.visitor_phone_number}'),
                                      // Text(
                                      //     'Here to meet: ${widget.visitor.visitor_whom_meet}'),
                                      Container(
                                          width: 150,
                                          alignment: Alignment.bottomLeft,
                                          child: QrImageView(
                                            data:
                                                "Name: ${widget.visitor.visitor_name}, Organization: ${widget.visitor.visitor_organization}, Email: ${widget.visitor.visitor_email}, Phone No.: ${widget.visitor.visitor_phone_number}, Here to meet: ${widget.visitor.visitor_whom_meet}",
                                            version: QrVersions.auto,
                                            size: 80.0,
                                          )),

                                      // Expanded(
                                      //   child: BarcodeWidget(
                                      //     data:
                                      //         'Visitor Info: ${widget.visitor.toJson().toString()}',
                                      //     barcode: Barcode.code128(),
                                      //     // width: 60,
                                      //     height: 60,
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // ElevatedButton(
                //   onPressed: _printVisitorPass,
                //   child: Text('Print Visitor Pass'),
                // ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 10, 60, 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                _printVisitorPass();
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => VisitorsListPage(),
                                //   ),
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFFFFFFF),
                                  side: BorderSide(
                                      width: 1.0, color: Color(0xFFFF5C00)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text(
                                'Print Visitor Pass',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFFF39D23),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SecondRoute(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFFFFFFF),
                                  side: BorderSide(
                                      width: 1.0, color: Color(0xFFFF5C00)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text(
                                'Add new Visitor',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFFF39D23),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
