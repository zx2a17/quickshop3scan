// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authUserStreamHash() => r'935570a470433a63384f20a1551ec1c98c5063de';

/// See also [_authUserStream].
@ProviderFor(_authUserStream)
final _authUserStreamProvider = AutoDisposeStreamProvider<auth.User?>.internal(
  _authUserStream,
  name: r'_authUserStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authUserStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef _AuthUserStreamRef = AutoDisposeStreamProviderRef<auth.User?>;
String _$loggedInHash() => r'a088fa979b2dbc39ebbd726c2439ad527d87989f';

/// See also [loggedIn].
@ProviderFor(loggedIn)
final loggedInProvider = AutoDisposeProvider<bool>.internal(
  loggedIn,
  name: r'loggedInProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loggedInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LoggedInRef = AutoDisposeProviderRef<bool>;
String _$userRepoHash() => r'2d39f2eeb86f809b207394e4c30f82d2ab3087aa';

/// See also [UserRepo].
@ProviderFor(UserRepo)
final userRepoProvider = AutoDisposeNotifierProvider<UserRepo, User?>.internal(
  UserRepo.new,
  name: r'userRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserRepo = AutoDisposeNotifier<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
