import 'package:flutter/material.dart';
import 'package:sado/model/user.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({Key? key}) : super(key: key);

  @override
  _AssessmentScreenState createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  // TextEditingController _ageCtrl = TextEditingController();
  TextEditingController _heightCtrl = TextEditingController();
  TextEditingController _weightCtrl = TextEditingController();
  double _ageSlider = 20.0;

  String dropdownGender = "Male";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SADO"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/food-bg3.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Container(
                  decoration: new BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            30,
                            0,
                            10,
                          ),
                          child: Text(
                            'Clinical Assessment',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            0,
                            15,
                            0,
                            10,
                          ),
                          child: Text(
                            'Please enter all the details below',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: Colors.grey,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(15.0),
                        //   child: SizedBox(
                        //     width: 500,
                        //     child: TextFormField(
                        //       validator: (value) {
                        //         if (value == null || value.isEmpty) {
                        //           return "Please enter your age";
                        //         }
                        //         return null;
                        //       },
                        //       controller: _ageCtrl,
                        //       decoration: InputDecoration(
                        //         border: OutlineInputBorder(),
                        //         labelText: "Please enter your age",
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Tooltip(
                                message:
                                    'Your age is required for us to calculate the calorie goals using the Mifflin St Joer Equation.',
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                                child: Text('Enter your age'),
                              ),
                              SizedBox(
                                width: 500,
                                child: SfSlider(
                                  min: 15.0,
                                  max: 65.0,
                                  value: _ageSlider,
                                  stepSize: 1,
                                  interval: 10,
                                  showTicks: true,
                                  showLabels: true,
                                  enableTooltip: true,
                                  // minorTicksPerInterval: 2,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      _ageSlider = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: 500,
                            child: Tooltip(
                              message:
                                  'Your height will be used to calculate the BMI and Calorie Goals',
                              textStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your height";
                                  } else if (int.parse(value) < 60 ||
                                      int.parse(value) > 300) {
                                    return "Please enter valid height";
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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: 500,
                            child: Tooltip(
                              message:
                                  'Your weight will be used to calculate the BMI and Calorie Goals',
                              textStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your weight";
                                  } else if (int.parse(value) < 15 ||
                                      int.parse(value) > 300) {
                                    return "Please enter valid weight";
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
                              items: <String>[
                                'Male',
                                'Female'
                              ].map<DropdownMenuItem<String>>((String value) {
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
                                    _ageSlider,
                                    double.parse(_weightCtrl.text),
                                    double.parse(_heightCtrl.text),
                                    dropdownGender,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Assessment completed"),
                                    ),
                                  );
                                  Navigator.pushNamed(
                                    context,
                                    "/compeitition",
                                  );
                                }
                              },
                              child: Text("Proceed"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
