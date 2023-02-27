import 'package:flutter/material.dart';

import 'User.dart';

class AddUserDialog extends StatefulWidget {
  final Function(User) addUser;

  AddUserDialog(this.addUser);

  @override
  _AddUserDialogState createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var usernameController = TextEditingController();
    // ignore: unused_local_variable
    var emailController = TextEditingController();
    // ignore: unused_local_variable
    var phoneNoController = TextEditingController();

    return Container(
        padding: EdgeInsets.all(8),
        height: 350,
        width: 400,
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              Text(
                'Add User',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.blue),
              ),

              buildTextField("Username", usernameController),
              buildTextField("Email", emailController),
              buildTextField("Phone No", phoneNoController),

              ElevatedButton(
                onPressed: () {
                  final user = User(usernameController.text,
                      emailController.text, phoneNoController.text);

                  widget.addUser(user);
                  Navigator.of(context).pop();
                },
                child: Text('Add User'),
              ),
            ],
          ),
        ));
  }
}

Widget buildTextField(String hint, TextEditingController controller) {
  // ignore: avoid_unnecessary_containers
  return Container(
      margin: EdgeInsets.all(4),
      child: TextField(
        // ignore: duplicate_ignore
        decoration: InputDecoration(
            labelText: hint,
            // ignore: prefer_const_constructors
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            )),
        controller: controller,
      ));
}
