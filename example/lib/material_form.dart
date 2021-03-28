import 'package:flrx_validator/flrx_validator.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class MaterialForm extends StatefulWidget {
  MaterialForm({Key key}) : super(key: key);

  @override
  _MaterialFormState createState() => _MaterialFormState();
}

class _MaterialFormState extends State<MaterialForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> _myActivities;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Material Form Validator')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                validator: Validator<String>(rules: [
                  RequiredRule<String>(),
                  EmailRule(),
                ]),
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextFormField(
                validator: Validator<String>(rules: [
                  RequiredRule<String>(),
                  EachRule<String>(
                    <Rule<String>>[
                      MinLengthRule(8),
                      RegexRule(
                        r'(?=.*[a-z])',
                        validationMessage:
                            ":entity should contain one lowercase character",
                      ),
                    ],
                  )
                ]),
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
              buildStringDropdown(),
              buildIntDropdown(),
              buildMultiSelectField(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: onFormSubmitPressed,
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStringDropdown() {
    return DropdownButtonFormField<String>(
      validator: Validator<String>(rules: [RequiredRule<String>()]),
      value: "",
      items: const <DropdownMenuItem<String>>[
        DropdownMenuItem<String>(
          child: Text('Please select an Item'),
          value: "",
        ),
        DropdownMenuItem<String>(
          child: Text('Item 1'),
          value: "Item 1",
        )
      ],
      onChanged: (String value) {},
    );
  }

  Widget buildIntDropdown() {
    return DropdownButtonFormField<int>(
      validator: Validator<int>(rules: [RequiredRule<int>()]),
      value: 1,
      items: const <DropdownMenuItem<int>>[
        DropdownMenuItem<int>(
          child: Text('Please select an Item'),
          value: null,
        ),
        DropdownMenuItem<int>(
          child: Text('Item 1'),
          value: 1,
        ),
        DropdownMenuItem<int>(
          child: Text('Item 2'),
          value: 2,
        )
      ],
      onChanged: (int value) {},
    );
  }

  void onFormSubmitPressed() {
    if (_formKey.currentState.validate()) {
      // Process data.
    }
  }

  Widget buildMultiSelectField() {
    return MultiSelectFormField(
      autovalidate: false,
      titleText: 'My workouts',
      validator: Validator<dynamic>(rules: <Rule<List<String>>>[
        RequiredRule<List<String>>(),
      ]),
      dataSource: const <Map<String, String>>[
        const <String, String>{
          "display": "Running",
          "value": "Running",
        },
        const <String, String>{
          "display": "Climbing",
          "value": "Climbing",
        },
        const <String, String>{
          "display": "Walking",
          "value": "Walking",
        },
        const <String, String>{
          "display": "Swimming",
          "value": "Swimming",
        },
        const <String, String>{
          "display": "Soccer Practice",
          "value": "Soccer Practice",
        },
        const <String, String>{
          "display": "Baseball Practice",
          "value": "Baseball Practice",
        },
        const <String, String>{
          "display": "Football Practice",
          "value": "Football Practice",
        },
      ],
      textField: 'display',
      valueField: 'value',
      okButtonLabel: 'OK',
      cancelButtonLabel: 'CANCEL',
      // required: true,
      hintText: 'Please choose one or more',
      initialValue: _myActivities,
      onSaved: (value) {
        setState(() {
          _myActivities = value;
        });
      },
    );
  }
}
