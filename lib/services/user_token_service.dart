import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_token_service.g.dart';

@riverpod
Stream<auth.User?> _userChangesStream(Ref ref) {
  return auth.FirebaseAuth.instance.userChanges();
}

@riverpod
auth.User? _authUser(Ref ref) {
  final userChanges = ref.watch(_userChangesStreamProvider);
  return userChanges.valueOrNull;
}

@Riverpod(keepAlive: true)
UserTokenService userTokenService(Ref ref) {
  return UserTokenService(ref);
}

class UserTokenService {
  UserTokenService(this.ref);
  final Ref ref;

  Future<String?> getToken() async {
    final user = ref.read(_authUserProvider);
    if (user != null) {
      return user.getIdToken();
    }
    return null;
  }
}
