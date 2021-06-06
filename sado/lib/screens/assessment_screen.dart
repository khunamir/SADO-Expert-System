import 'package:flutter/material.dart';
import 'package:sado/model/user.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({Key? key}) : super(key: key);

  @override
  _AssessmentScreenState createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  TextEditingController _ageCtrl = TextEditingController();
  TextEditingController _heightCtrl = TextEditingController();
  TextEditingController _weightCtrl = TextEditingController();

  String dropdownGender = "Male";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SADO"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 500,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your age";
                          }
                          return null;
                        },
                        controller: _ageCtrl,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Please enter your age",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 500,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your height";
                          }
                          return null;
                        },
                        controller: _heightCtrl,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Please enter your height (cm)",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 500,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your weight";
                          }
                          return null;
                        },
                        controller: _weightCtrl,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Please enter your weight (kg)",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 500,
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        isExpanded: true,
                        value: dropdownGender,
                        onChanged: (String? value) {
                          setState(() {
                            dropdownGender = value!;
                          });
                        },
                        items: <String>['Male', 'Female']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            user.setAssessment(
                              double.parse(_ageCtrl.text),
                              double.parse(_weightCtrl.text),
                              double.parse(_heightCtrl.text),
                              dropdownGender,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Assessment completed"),
                              ),
                            );
                            Navigator.pushNamedAndRemoveUntil(context, "/compeitition", (route) => false);
                          }
                        },
                        child: Text("Submit"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
