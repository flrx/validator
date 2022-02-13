import 'package:flrx_validator/flrx_validator.dart';
import 'package:flutter/cupertino.dart';

class CupertinoForm extends StatefulWidget {
  const CupertinoForm({Key? key}) : super(key: key);

  @override
  _CupertinoFormState createState() => _CupertinoFormState();
}

class _CupertinoFormState extends State<CupertinoForm> {
  final TextEditingController _textEditingController = TextEditingController();
  String emailValidationMessage = "";

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontFamily: '.SF UI Text',
        inherit: false,
        fontSize: 17.0,
        color: CupertinoColors.black,
      ),
      child: CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            previousPageTitle: "Form Selection",
            middle: Text('Cupertino Form Validation'),
          ),
          child: CupertinoScrollbar(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 72),
                  CupertinoTextField(
                    controller: _textEditingController,
                    prefixMode: OverlayVisibilityMode.always,
                    placeholder: 'Email',
                    prefix: const Icon(
                      CupertinoIcons.mail_solid,
                      color: CupertinoColors.lightBackgroundGray,
                      size: 28.0,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.0, color: CupertinoColors.inactiveGray)),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
                    clearButtonMode: OverlayVisibilityMode.editing,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(34, 8, 16, 16),
                    child: Text(
                      emailValidationMessage,
                      style: const TextStyle(
                        color: CupertinoColors.destructiveRed,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Center(
                    child: CupertinoButton.filled(
                        child: const Text('Submit'), onPressed: onFormSubmitPressed),
                  )
                ],
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void onFormSubmitPressed() {
    String value = _textEditingController.text;
    setState(() {
      emailValidationMessage = Validator<String>(rules: [])
              .add(RequiredRule())
              .add(EmailRule())
              .validate(value) ??
          '';
    });
  }
}
