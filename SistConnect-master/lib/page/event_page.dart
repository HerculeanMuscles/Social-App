import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/events_view.dart';
import 'event_widget.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Events'),
            backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: StreamBuilder<List<EventsView>>(
                    stream: readEvents(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something is wrong! ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final events = snapshot.data;
                        return ListView(
                          children: events.map(buildEvents).toList(),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      );

  Widget buildEvents(EventsView event) => Event(
        title: event.title,
        date: event.date,
        description: event.description,
        image: event.image,
      );

  Stream<List<EventsView>> readEvents() => FirebaseFirestore.instance
      .collection("events")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => EventsView.fromJson(doc.data())).toList());
}
