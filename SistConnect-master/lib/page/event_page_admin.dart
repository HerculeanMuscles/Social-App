import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistconnect/page/event_admin.dart';
import 'package:sistconnect/page/event_create.dart';
import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';
import 'event_widget.dart';

class EventPageAdmin extends StatefulWidget {
  const EventPageAdmin({Key key}) : super(key: key);

  @override
  State<EventPageAdmin> createState() => _EventPageAdminState();
}

class _EventPageAdminState extends State<EventPageAdmin> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Events'),
          backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 10),
                  child: FFButtonWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EventForm()),
                      );
                    },
                    text: 'Add new event',
                    options: FFButtonOptions(
                      height: 40,
                      color: Color(0xFF7879F1),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
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
                EventAdmin(
                    title: "Fes",
                    date: "25 March",
                    image: "assets/fes.jpg",
                    description:
                        "Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is simply text copy that serves to fill a space without actually saying."),
                EventAdmin(
                    title: "Marrakech",
                    date: "24 Oct",
                    image: "assets/marrakech.jpg",
                    description:
                        "Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is simply text copy that serves to fill a space without actually saying anything meaningful.  will look like in the final product."),
              ],
            ),
          ],
        ),
      );
}
