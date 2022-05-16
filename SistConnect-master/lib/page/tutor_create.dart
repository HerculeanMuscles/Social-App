import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/tutor.dart';

class TutorForm extends StatefulWidget {
  const TutorForm({Key key}) : super(key: key);

  @override
  State<TutorForm> createState() => _TutorFormState();
}

class _TutorFormState extends State<TutorForm> {
  final controllerTitle = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(''),
        backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  controller: controllerTitle,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'Title',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  controller: controllerDescription,
                  style: const TextStyle(color: Colors.white),
                  maxLines: 6,
                  minLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'Description',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  controller: controllerDate,
                  style: const TextStyle(color: Colors.white),
                  minLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'Date of event',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ElevatedButton(
                    onPressed: () {
                      final tutor = Tutor(
                          title: controllerTitle.text,
                          date: controllerDate.text,
                          description: controllerDescription.text);
                      Navigator.pop(context);

                      createTutoring(tutor);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(120, 121, 241, 1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 90, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text('Create a new event')),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future createTutoring(Tutor tutor) async {
    final docTutoring = FirebaseFirestore.instance.collection("tutoring").doc();
    tutor.id = docTutoring.id;

    final json = tutor.toJson();
    await docTutoring.set(json);
  }
}
