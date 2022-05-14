import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SistconnectFirebaseUser {
  SistconnectFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

SistconnectFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SistconnectFirebaseUser> sistconnectFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<SistconnectFirebaseUser>(
        (user) => currentUser = SistconnectFirebaseUser(user));
