import 'package:sistconnect/page/homepagesAdmin.dart';

import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../onboarding/onboarding_widget.dart';
import '../page/event_page.dart';
import '../page/homepages.dart';
import '../signup/signup_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailLoginController;
  TextEditingController passwordLoginController;
  bool passwordLoginVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailLoginController = TextEditingController();
    passwordLoginController = TextEditingController();
    passwordLoginVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF131629),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25, 110, 25, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                    child: Image.asset(
                      'assets/images/Group_5.png',
                      width: 100,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 100),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: TextFormField(
                              controller: emailLoginController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'emailLoginController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(right: 0),
                                hintText: 'Enter your email',
                                hintStyle: TextStyle(
                                    color: Color(0x9AE0E3E7), fontSize: 15),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                filled: true,
                                fillColor: Color(0xFF1C2039),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Mulish',
                                    color: Color(0x9AE0E3E7),
                                    fontWeight: FontWeight.normal,
                                  ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          TextFormField(
                            controller: passwordLoginController,
                            onChanged: (_) => EasyDebounce.debounce(
                              'passwordLoginController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            autofocus: true,
                            obscureText: !passwordLoginVisibility,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                color: Color(0x9AE0E3E7),
                                height: 1,
                              ),
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(
                                  color: Color(0x9AE0E3E7), fontSize: 15),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              filled: true,
                              fillColor: Color(0xFF1C2039),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => passwordLoginVisibility =
                                      !passwordLoginVisibility,
                                ),
                                child: Icon(
                                  passwordLoginVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF757575),
                                  size: 22,
                                ),
                              ),
                              contentPadding: EdgeInsets.only(right: -45.0),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Mulish',
                                      color: Color(0x9AE0E3E7),
                                      fontWeight: FontWeight.normal,
                                    ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final user = await signInWithEmail(
                                  context,
                                  emailLoginController.text,
                                  passwordLoginController.text,
                                );
                                if (user == null) {
                                  return;
                                } else if (user.email == 'admin@admin.com') {
                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePageAdmin(),
                                    ),
                                    (r) => false,
                                  );
                                } else {
                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                    (r) => false,
                                  );
                                }
                              },
                              text: 'Login',
                              options: FFButtonOptions(
                                width: 130,
                                height: 45,
                                color: Color(0xFF9FAAFF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account? ',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Mulish',
                                        color: Color(0xFFCFCFCF),
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignupWidget(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Register',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Mulish',
                                            color: Color(0xFF5F70FF),
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
