import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';
import 'event_widget.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
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
              children: <Widget>[
                Event(
                    title: "Fes",
                    date: "25 March",
                    image: "assets/fes.jpg",
                    description:
                        "Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is simply text copy that serves to fill a space without actually saying."),
                Event(
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
