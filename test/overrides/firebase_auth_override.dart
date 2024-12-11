import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:mocktail/mocktail.dart';
import 'package:quickshop/models/user.dart';
import 'package:quickshop/services/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

class MockAuth extends Mock implements auth.FirebaseAuth {}

class MockAuthUser extends Mock implements auth.User {}

/// Utility class for overriding the [firebaseAuthProvider] with a mock in tests.
class FbAuthOverride {
  final _controller = StreamController<auth.User?>();
  User? _user;
  late Override providerOverride;
  late MockAuth mockAuth;

  FbAuthOverride({required User? user}) {
    mockAuth = MockAuth();
    _user = user;
    when(() => mockAuth.currentUser).thenAnswer((_) => _getMockAuthUser());
    when(() => mockAuth.authStateChanges()).thenAnswer((_) => _controller.stream);

    providerOverride = firebaseAuthProvider.overrideWith((ref) {
      return mockAuth;
    });
  }

  MockAuthUser? _getMockAuthUser() {
    final user = _user;
    if (user == null) {
      return null;
    }
    final mockAuthUser = MockAuthUser();
    when(() => mockAuthUser.uid).thenReturn(user.id);
    when(() => mockAuthUser.displayName).thenReturn(user.name);
    when(() => mockAuthUser.email).thenReturn(user.email);
    return mockAuthUser;
  }

  setUser(User? newUser) {
    _user = newUser;
    _controller.add(_getMockAuthUser());
  }
}
