import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sistconnect/backend/storage_service.dart';
import 'package:sistconnect/model/events.dart';

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
    final Storage storage = Storage();
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
              // Container(
              //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              //   child: ElevatedButton(
              //     style: ButtonStyle(
              //       padding:
              //           MaterialStateProperty.all(const EdgeInsets.all(18)),
              //       alignment: Alignment.centerLeft,
              //       backgroundColor: MaterialStateProperty.all<Color>(
              //           Color.fromRGBO(19, 22, 41, 1)),
              //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //           RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(5.0),
              //               side: BorderSide(color: Colors.white, width: 2.0))),
              //     ),
              //
              //     child: Text(
              //       'Upload image',
              //       style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              //     ),
              //   ),
              // ),
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
                child: DateTimeField(
                  controller: controllerDate,
                  style: const TextStyle(color: Colors.white),
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
                  format: DateFormat(),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ElevatedButton(
                    onPressed: () async {
                      final results = await FilePicker.platform.pickFiles(
                        allowMultiple: false,
                        type: FileType.custom,
                        allowedExtensions: ['png', 'jpg'],
                      );
                      if (results == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'No file selected.',
                            ),
                          ),
                        );
                        return null;
                      }
                      final path = results.files.single.path;
                      final fileName = results.files.single.name;

                      storage
                          .uploadFile(path, fileName)
                          .then((value) => print('Done'));

                      final events = Events(
                        title: controllerTitle.text,
                        date: DateTime.parse(controllerDate.text),
                        description: controllerDescription.text,
                        image: 'gs://sist-connect-97596.appspot.com/images/$fileName',
                      );
                      Navigator.pop(context);

                      createEvents(events);
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

  Future createEvents(Events events) async {
    final docEvent = FirebaseFirestore.instance.collection("events").doc();
    events.id = docEvent.id;

    final json = events.toJson();
    await docEvent.set(json);
  }
}
