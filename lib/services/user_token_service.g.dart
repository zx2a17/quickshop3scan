// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userChangesStreamHash() => r'979c8e2a7579ad4f882d3494582a7c3a8c8b8ed9';

/// See also [_userChangesStream].
@ProviderFor(_userChangesStream)
final _userChangesStreamProvider =
    AutoDisposeStreamProvider<auth.User?>.internal(
  _userChangesStream,
  name: r'_userChangesStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userChangesStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef _UserChangesStreamRef = AutoDisposeStreamProviderRef<auth.User?>;
String _$authUserHash() => r'cfd89ab39f81f38b813f45e55ff7c4b67ccdd166';

/// See also [_authUser].
@ProviderFor(_authUser)
final _authUserProvider = AutoDisposeProvider<auth.User?>.internal(
  _authUser,
  name: r'_authUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef _AuthUserRef = AutoDisposeProviderRef<auth.User?>;
String _$userTokenServiceHash() => r'e33cef97861ae8a74e38a936dc03fe16f04026db';

/// See also [userTokenService].
@ProviderFor(userTokenService)
final userTokenServiceProvider = Provider<UserTokenService>.internal(
  userTokenService,
  name: r'userTokenServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userTokenServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserTokenServiceRef = ProviderRef<UserTokenService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
