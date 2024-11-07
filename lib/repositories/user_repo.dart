import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user.dart';

part 'user_repo.g.dart';

@riverpod
Stream<auth.User?> _authUserStream(Ref ref) {
  return auth.FirebaseAuth.instance.authStateChanges();
}

@riverpod
User? user(Ref ref) {
  // Watch for changes on the auth user stream, but we can get the current user synchronously.
  final _ = ref.watch(_authUserStreamProvider);
  final authUser = auth.FirebaseAuth.instance.currentUser;
  if (authUser != null) {
    return User(
      id: authUser.uid,
      name: authUser.displayName ?? '',
      email: authUser.email ?? '',
    );
  }
  return null;
}

@riverpod
bool loggedIn(Ref ref) {
  return ref.watch(userProvider) != null;
}
