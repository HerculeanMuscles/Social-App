import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_util.dart';

import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stream_transform/stream_transform.dart';
import 'firebase_user_provider.dart';

export 'anonymous_auth.dart';
export 'apple_auth.dart';
export 'email_auth.dart';
export 'google_auth.dart';

/// Tries to sign in or create an account using Firebase Auth.
/// Returns the User object if sign in was successful.
Future<User> signInOrCreateAccount(
    BuildContext context, Future<UserCredential> Function() signInFunc) async {
  try {
    final userCredential = await signInFunc();
    await maybeCreateUser(userCredential.user);
    return userCredential.user;
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: ${e.message}')),
    );
    return null;
  }
}

Future signOut() {
  _currentJwtToken = '';
  FirebaseAuth.instance.signOut();
}

Future sendEmailVerification() async =>
    currentUser?.user?.sendEmailVerification();

String _currentJwtToken = '';

String get currentUserEmail =>
    currentUserDocument?.email ?? currentUser?.user?.email ?? '';

String get currentUserUid =>
    currentUserDocument?.uid ?? currentUser?.user?.uid ?? '';

String get currentUserDisplayName =>
    currentUserDocument?.displayName ?? currentUser?.user?.displayName ?? '';

String get currentUserPhoto =>
    currentUserDocument?.photoUrl ?? currentUser?.user?.photoURL ?? '';

String get currentPhoneNumber =>
    currentUserDocument?.phoneNumber ?? currentUser?.user?.phoneNumber ?? '';

String get currentJwtToken => _currentJwtToken ?? '';

bool get currentUserEmailVerified {
  // Reloads the user when checking in order to get the most up to date
  // email verified status.
  if (currentUser?.user != null && !currentUser.user.emailVerified) {
    currentUser.user
        .reload()
        .then((_) => currentUser.user = FirebaseAuth.instance.currentUser);
  }
  return currentUser?.user?.emailVerified ?? false;
}

DocumentReference get currentUserReference => currentUser?.user != null
    ? UsersRecord.collection.doc(currentUser.user.uid)
    : null;

UsersRecord currentUserDocument;
final authenticatedUserStream = FirebaseAuth.instance
    .authStateChanges()
    .map<String>((user) {
      // Store jwt token on user update.
      () async {
        _currentJwtToken = await user?.getIdToken();
      }();
      return user?.uid ?? '';
    })
    .switchMap((uid) => queryUsersRecord(
        queryBuilder: (user) => user.where('uid', isEqualTo: uid),
        singleRecord: true))
    .map((users) => currentUserDocument = users.isNotEmpty ? users.first : null)
    .asBroadcastStream();

class AuthUserStreamWidget extends StatelessWidget {
  const AuthUserStreamWidget({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: authenticatedUserStream,
        builder: (context, _) => child,
      );
}
