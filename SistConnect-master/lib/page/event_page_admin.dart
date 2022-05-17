import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sistconnect/page/event_create_test.dart';
import 'package:sistconnect/page/event_widget_admin.dart';
import 'package:sistconnect/page/event_create.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../model/events_view.dart';

class EventPageAdmin extends StatefulWidget {
  const EventPageAdmin({Key key}) : super(key: key);

  @override
  State<EventPageAdmin> createState() => _EventPageAdminState();
}

class _EventPageAdminState extends State<EventPageAdmin> {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 10),
                child: FFButtonWidget(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EventFormTest()),
                    );
                  },
                  text: 'Add new event',
                  options: FFButtonOptions(
                    height: 40,
                    color: Color(0xFF7879F1),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Mulish',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 50,
                  ),
                ),
              ),
              Flexible(
                child: StreamBuilder<List<EventsView>>(
                    stream: readEvents(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something is wrong! ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final events = snapshot.data;
                        return RefreshIndicator(
                          onRefresh: _refresh,
                          child: ListView(
                            children: events.map(buildEvents).toList(),
                          ),
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

  Widget buildEvents(EventsView event) => EventAdmin(
        title: event.title,
        date: event.date,
        description: event.description,
        id: event.id,
        image: event.image,
      );

  Stream<List<EventsView>> readEvents() => FirebaseFirestore.instance
      .collection("events")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => EventsView.fromJson(doc.data())).toList());

  Future<void> _refresh() {
    return Future.delayed(Duration(seconds: 3));
  }
}


