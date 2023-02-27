import 'package:first_app1/User.dialog.dart';
import 'package:flutter/material.dart';
import 'User.dialog.dart';
import 'User.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {

   List<User> userList = [];

  @override
  Widget build(BuildContext context) {

     
    void addUserData(User user) {
      setState(() {
        userList.add(user);
      });
    }

    void showUserDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: AddUserDialog(addUserData),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      );
    }

  

    

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: showUserDialog,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('User List'),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    margin: EdgeInsets.all(4),
                    elevation: 8,
                    child: ListTile(
                      title: Text(
                        userList[index].username,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                      subtitle: Text(
                        userList[index].email,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black12),
                      ),
                      trailing: Text(
                        userList[index].phoneNo,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black26),
                      ),
                    ));
              },
              itemCount: userList.length,
            )));
  }
}
