import 'package:big_two_calculator/view_models/users_vm.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _textFieldController = TextEditingController();
  final GlobalKey<FormState> _currentForm = GlobalKey<FormState>();

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  bool _isButtonDisable = true;

  void _submitName() async {
    UsersVM usersViewModel = UsersVM();

    await usersViewModel.insertUser(_textFieldController.text);

    _textFieldController.clear();
    //TODO: lower keyboard after submit
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Form(
              key: _currentForm,
              onChanged: () => setState(() => _isButtonDisable = _currentForm.currentState.validate()),
              child: TextFormField(
                controller: _textFieldController,
                validator: (value) => value.length == 0 ? null : "",
              ),
            ),
            RaisedButton(
              onPressed: _isButtonDisable ? null : () => _submitName(),
              child: Text("Submit Name"),
            ),
          ],
        ),
      ),
    );
  }
}
