// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_hive/models/student_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  final students = Hive.box('School');

  late String name;

  late int grade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: WatchBoxBuilder(
                box: Hive.box('School'),
                builder: (context, students) {
                  return ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final stud = students.get(index) as StudentModel;
                      return ListTile(
                        title: Text(stud.name),
                        subtitle: Text(stud.grade.toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                students.putAt(index,
                                    StudentModel(name: 'fady', grade: 8));
                              },
                              child: Icon(Icons.refresh_outlined),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                students.deleteAt(index);
                              },
                              child: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Form(
              key: _formKey, // Set the key attribute here
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    onChanged: (String? value) {
                      name = value!;
                    },
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a grade';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Grade',
                    ),
                    onChanged: (String? value) {
                      grade = int.parse(value!);
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // if (_formKey.currentState != null &&
                      //     _formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      StudentModel studentModel =
                          StudentModel(name: name, grade: grade);
                      students.add(studentModel);
                      // }
                    },
                    child: Text('save'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
