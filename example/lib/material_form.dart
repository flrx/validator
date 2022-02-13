import 'package:flrx_validator/flrx_validator.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class MaterialForm extends StatefulWidget {
  const MaterialForm({Key? key}) : super(key: key);

  @override
  _MaterialFormState createState() => _MaterialFormState();
}

class _MaterialFormState extends State<MaterialForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> _myActivities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material Form Validator')),
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
                decoration: const InputDecoration(hintText: 'Email'),
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
                decoration: const InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
              buildStringDropdown(),
              buildIntDropdown(),
              buildMultiSelectField(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: onFormSubmitPressed,
                  child: const Text('Submit'),
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
      onChanged: (String? value) {},
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
      onChanged: (int? value) {},
    );
  }

  void onFormSubmitPressed() {
    if (_formKey.currentState?.validate() == true) {
      // Process data.
    }
  }

  Widget buildMultiSelectField() {
    return MultiSelectFormField(
      autovalidate: false,
      title: const Text('My workouts'),
      validator: Validator<dynamic>(rules: <Rule<List<String>>>[
        RequiredRule<List<String>>(),
      ]),
      dataSource: const <Map<String, String>>[
        <String, String>{
          "display": "Running",
          "value": "Running",
        },
        <String, String>{
          "display": "Climbing",
          "value": "Climbing",
        },
        <String, String>{
          "display": "Walking",
          "value": "Walking",
        },
        <String, String>{
          "display": "Swimming",
          "value": "Swimming",
        },
        <String, String>{
          "display": "Soccer Practice",
          "value": "Soccer Practice",
        },
        <String, String>{
          "display": "Baseball Practice",
          "value": "Baseball Practice",
        },
        <String, String>{
          "display": "Football Practice",
          "value": "Football Practice",
        },
      ],
      textField: 'display',
      valueField: 'value',
      okButtonLabel: 'OK',
      cancelButtonLabel: 'CANCEL',
      // required: true,
      hintWidget: const Text('Please choose one or more'),
      initialValue: _myActivities,
      onSaved: (value) {
        setState(() {
          _myActivities = value;
        });
      },
    );
  }
}
