import 'package:flutter/material.dart';

class RegisteredForm extends StatefulWidget {
  const RegisteredForm({super.key});

  @override
  RegisteredFormState createState() {
    return RegisteredFormState();
  }
}

class RegisteredFormState extends State<RegisteredForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(7, 9, 7, 5),
                child: Text(
                  'Visitor phone number',
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
                    hintText: 'Enter phone number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone numner';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Processing Data'),
                              ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFF39D23),
                              side: BorderSide(
                                  width: 1.0, color: Color(0xFFFF5C00)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.normal,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
