// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  late String name;
  late int grade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Name'),
                    subtitle: Text('Gread'),
                  ),
                ],
              ),
            ),
            Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  onSaved: (String? value) {
                    name = value!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Grade',
                  ),
                  onSaved: (String? value) {
                    grade = int.parse(value!);
                  },
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
