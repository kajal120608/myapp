import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testapp/custom/HiveInitializer.dart';
import 'package:testapp/models/user.dart';

class vb extends StatefulWidget {
  const vb({super.key});

  @override
  State<vb> createState() => _vbState();
}

class _vbState extends State<vb> {
  var data="Test";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text("User Screen"),),
     body: Container(
      child: Center(
        child: ElevatedButton(onPressed: () async{
          Hive.initFlutter();
          HiveInitializer.initializeHive();
          var data = new User(
            usrName: "User4", 
            usrEmail: "user4@gmail.com", 
            usrPassword: "123456");
          var box = await Hive.openBox<User>('users');
          await box.add(data);
          var list = box.values.toList();
          for(var d=0;d<list.length;d++){
            print(list[d].usrEmail);
          }
        }, child: Text("Click Here")),),
     ),
    );
  }
}