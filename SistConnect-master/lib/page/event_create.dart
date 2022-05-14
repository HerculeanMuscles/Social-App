import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'event_widget.dart';

class EventForm extends StatefulWidget {
  const EventForm({Key key}) : super(key: key);

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final controllerTitle = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerDescription = TextEditingController();
  final controllerImage = TextEditingController();

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
                  controller: controllerImage,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'Image',
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
                      final events = Event(
                        title: controllerTitle.text,
                        date: controllerDate.text,
                        description: controllerDescription.text,
                        image: controllerImage.text,
                      );
                      Navigator.pop(context);

                      // createEvents(events);
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
  // Future createEvents(Events events) async{
  //   final docEvent = FirebaseFirestore.instance.collection("events").doc();
  //   events.id = docEvent.id;
  //
  //   final json = events.toJson();
  //   await docEvent.set(json);
  // }
}
