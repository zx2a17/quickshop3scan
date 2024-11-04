// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authUserStreamHash() => r'a0e8ec03fcfae84f3dd77351cbe9e4ca8bf0efb3';

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
String _$userHash() => r'c0fc8a0dacfc48baef772b9604980a013855ffd2';

/// See also [user].
@ProviderFor(user)
final userProvider = AutoDisposeProvider<User?>.internal(
  user,
  name: r'userProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserRef = AutoDisposeProviderRef<User?>;
String _$loggedInHash() => r'145948c55c707d7b3ebe4c26c655a350e42558ba';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
