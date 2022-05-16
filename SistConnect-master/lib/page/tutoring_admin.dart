import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class TutorsAdmin extends StatefulWidget {
  final String title;
  final String date;
  final String description;

  const TutorsAdmin({Key key, this.title, this.date, this.description})
      : super(key: key);

  @override
  State<TutorsAdmin> createState() => _TutorsAdminState();
}

class _TutorsAdminState extends State<TutorsAdmin> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 12),
        color: const Color.fromRGBO(34, 38, 60, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title /*"Tutor Event"*/,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Card(
                      color: const Color.fromRGBO(95, 112, 255, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        child: Text(
                          widget.date /*"date"*/
                          ,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    widget.description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                child: FFButtonWidget(
                  onPressed: () {},
                  text: 'Delete Event',
                  options: FFButtonOptions(
                    height: 40,
                    color: Color(0x77FF3F3F),
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
            ],
          ),
        ));
  }
}
