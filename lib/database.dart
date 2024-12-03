import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Database extends StatefulWidget {
  const Database({super.key});

  @override
  State<Database> createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {
  var name=TextEditingController();
  var email=TextEditingController();
  var password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DataBase"),
      ),

      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
             const SizedBox(height: 10,),
            TextField(
              controller: email,
               decoration: const InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
             const SizedBox(height: 10,),
            TextField(
              controller: password,
               decoration: const InputDecoration(
                border: OutlineInputBorder()
              ),
            ),

            const SizedBox(height: 10,),

            ElevatedButton(onPressed: () async{
             var data={
              "Id":"1",
              "Name":name.text,
              "Email":email.text,
              "Password":password.text,
             };

             var record =jsonEncode(data);
             await Hive.initFlutter();

             var box=await Hive.openBox("UserMaster");
             var no=box.length+1;
             box.put("t$no", data);

             var getdata= box.values.toList();
             print(getdata);
            
            
            }, child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}