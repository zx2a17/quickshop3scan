import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

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
