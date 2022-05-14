import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Profile'),
          backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Icon(
                CupertinoIcons.profile_circled,
                size: 100,
                color: Color.fromRGBO(255, 255, 255, 0.4),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Admin',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(130, 10, 130, 10),
              child: FFButtonWidget(
                onPressed: () async {
                  await signOut();
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginWidget(),
                    ),
                  );
                },
                text: 'Log out',
                options: FFButtonOptions(
                  // width: 130,
                  height: 45,
                  color: Color(0xFF7879F1),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Mulish',
                        color: Colors.white,
                        fontSize: 14,
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
      );
}
