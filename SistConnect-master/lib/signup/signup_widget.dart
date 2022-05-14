import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';

import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

import '../page/homepages.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key key}) : super(key: key);

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  TextEditingController confirmPasswordController;
  bool confirmPasswordVisibility;
  TextEditingController emailTextController;
  TextEditingController fullnameTextController;
  TextEditingController majorTextController;
  TextEditingController passwordTextController;
  bool passwordTextVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    confirmPasswordController = TextEditingController();
    confirmPasswordVisibility = false;
    emailTextController = TextEditingController();
    fullnameTextController = TextEditingController();
    majorTextController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordTextVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF131629),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(25, 50, 25, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: TextFormField(
                          controller: fullnameTextController,
                          onChanged: (_) => EasyDebounce.debounce(
                            'fullnameTextController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(right: 0),
                            labelStyle: TextStyle(
                              color: Color(0x9AE0E3E7),
                              height: 1,
                            ),
                            hintText: 'Enter your full name',
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
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Mulish',
                                    color: Color(0x9AE0E3E7),
                                    fontWeight: FontWeight.normal,
                                  ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: TextFormField(
                          controller: majorTextController,
                          onChanged: (_) => EasyDebounce.debounce(
                            'majorTextController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(right: 0),
                            labelStyle: TextStyle(
                              color: Color(0x9AE0E3E7),
                              height: 1,
                            ),
                            hintText: 'Enter your major',
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
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Mulish',
                                    color: Color(0x9AE0E3E7),
                                    fontWeight: FontWeight.normal,
                                  ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: TextFormField(
                          controller: emailTextController,
                          onChanged: (_) => EasyDebounce.debounce(
                            'emailTextController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(right: 0),
                            labelStyle: TextStyle(
                              color: Color(0x9AE0E3E7),
                              height: 1,
                            ),
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
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Mulish',
                                    color: Color(0x9AE0E3E7),
                                    fontWeight: FontWeight.normal,
                                  ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: TextFormField(
                          controller: passwordTextController,
                          onChanged: (_) => EasyDebounce.debounce(
                            'passwordTextController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          obscureText: !passwordTextVisibility,
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
                                () => passwordTextVisibility =
                                    !passwordTextVisibility,
                              ),
                              child: Icon(
                                passwordTextVisibility
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
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: TextFormField(
                          controller: confirmPasswordController,
                          onChanged: (_) => EasyDebounce.debounce(
                            'confirmPasswordController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          obscureText: !confirmPasswordVisibility,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Color(0x9AE0E3E7),
                              height: 1,
                            ),
                            hintText: 'Enter your password again',
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
                                () => confirmPasswordVisibility =
                                    !confirmPasswordVisibility,
                              ),
                              child: Icon(
                                confirmPasswordVisibility
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
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (passwordTextController.text !=
                                confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Passwords don\'t match!',
                                  ),
                                ),
                              );
                              return;
                            }

                            final user = await createAccountWithEmail(
                              context,
                              emailTextController.text,
                              passwordTextController.text,
                            );
                            if (user == null) {
                              return;
                            }

                            final usersCreateData = createUsersRecordData(
                              email: emailTextController.text,
                              password: passwordTextController.text,
                              displayName: fullnameTextController.text,
                              major: majorTextController.text,
                              role: 'user',
                            );
                            await UsersRecord.collection
                                .doc(user.uid)
                                .update(usersCreateData);

                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          text: 'Register',
                          options: FFButtonOptions(
                            width: 130,
                            height: 45,
                            color: Color(0xFF9FAAFF),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Mulish',
                                    color: Color(0xFFCFCFCF),
                                  ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginWidget(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Login',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
