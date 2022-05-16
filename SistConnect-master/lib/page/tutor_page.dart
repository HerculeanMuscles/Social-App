import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sistconnect/flutter_flow/flutter_flow_widgets.dart';
import 'package:sistconnect/page/tutor_create.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../model/tutor_view.dart';
import 'tutor_widget.dart';

class TutorPage extends StatefulWidget {
  const TutorPage({Key key}) : super(key: key);

  @override
  State<TutorPage> createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Tutoring'),
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
                      MaterialPageRoute(builder: (context) => TutorForm()),
                    );
                  },
                  text: 'Add new tutoring event',
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
                child: StreamBuilder<List<TutorView>>(
                    stream: readTutor(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something is wrong! ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final tutors = snapshot.data;
                        return ListView(
                          children: tutors.map(buildTutor).toList(),
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
  Widget buildTutor(TutorView tutor) => Tutors(
        title: tutor.title,
        date: tutor.date,
        description: tutor.description,
      );

  Stream<List<TutorView>> readTutor() => FirebaseFirestore.instance
      .collection("tutoring")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => TutorView.fromJson(doc.data())).toList());
}
