// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_invite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListInvite {
  String get id => throw _privateConstructorUsedError;
  String get listId => throw _privateConstructorUsedError;
  ListType get listType => throw _privateConstructorUsedError;
  String get listName => throw _privateConstructorUsedError;
  String get inviterId => throw _privateConstructorUsedError;
  String get inviterName => throw _privateConstructorUsedError;

  /// Create a copy of ListInvite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListInviteCopyWith<ListInvite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListInviteCopyWith<$Res> {
  factory $ListInviteCopyWith(
          ListInvite value, $Res Function(ListInvite) then) =
      _$ListInviteCopyWithImpl<$Res, ListInvite>;
  @useResult
  $Res call(
      {String id,
      String listId,
      ListType listType,
      String listName,
      String inviterId,
      String inviterName});
}

/// @nodoc
class _$ListInviteCopyWithImpl<$Res, $Val extends ListInvite>
    implements $ListInviteCopyWith<$Res> {
  _$ListInviteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListInvite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? listId = null,
    Object? listType = null,
    Object? listName = null,
    Object? inviterId = null,
    Object? inviterName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      listId: null == listId
          ? _value.listId
          : listId // ignore: cast_nullable_to_non_nullable
              as String,
      listType: null == listType
          ? _value.listType
          : listType // ignore: cast_nullable_to_non_nullable
              as ListType,
      listName: null == listName
          ? _value.listName
          : listName // ignore: cast_nullable_to_non_nullable
              as String,
      inviterId: null == inviterId
          ? _value.inviterId
          : inviterId // ignore: cast_nullable_to_non_nullable
              as String,
      inviterName: null == inviterName
          ? _value.inviterName
          : inviterName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListInviteImplCopyWith<$Res>
    implements $ListInviteCopyWith<$Res> {
  factory _$$ListInviteImplCopyWith(
          _$ListInviteImpl value, $Res Function(_$ListInviteImpl) then) =
      __$$ListInviteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String listId,
      ListType listType,
      String listName,
      String inviterId,
      String inviterName});
}

/// @nodoc
class __$$ListInviteImplCopyWithImpl<$Res>
    extends _$ListInviteCopyWithImpl<$Res, _$ListInviteImpl>
    implements _$$ListInviteImplCopyWith<$Res> {
  __$$ListInviteImplCopyWithImpl(
      _$ListInviteImpl _value, $Res Function(_$ListInviteImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListInvite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? listId = null,
    Object? listType = null,
    Object? listName = null,
    Object? inviterId = null,
    Object? inviterName = null,
  }) {
    return _then(_$ListInviteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      listId: null == listId
          ? _value.listId
          : listId // ignore: cast_nullable_to_non_nullable
              as String,
      listType: null == listType
          ? _value.listType
          : listType // ignore: cast_nullable_to_non_nullable
              as ListType,
      listName: null == listName
          ? _value.listName
          : listName // ignore: cast_nullable_to_non_nullable
              as String,
      inviterId: null == inviterId
          ? _value.inviterId
          : inviterId // ignore: cast_nullable_to_non_nullable
              as String,
      inviterName: null == inviterName
          ? _value.inviterName
          : inviterName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ListInviteImpl extends _ListInvite {
  const _$ListInviteImpl(
      {required this.id,
      required this.listId,
      required this.listType,
      required this.listName,
      required this.inviterId,
      required this.inviterName})
      : super._();

  @override
  final String id;
  @override
  final String listId;
  @override
  final ListType listType;
  @override
  final String listName;
  @override
  final String inviterId;
  @override
  final String inviterName;

  @override
  String toString() {
    return 'ListInvite(id: $id, listId: $listId, listType: $listType, listName: $listName, inviterId: $inviterId, inviterName: $inviterName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListInviteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.listId, listId) || other.listId == listId) &&
            (identical(other.listType, listType) ||
                other.listType == listType) &&
            (identical(other.listName, listName) ||
                other.listName == listName) &&
            (identical(other.inviterId, inviterId) ||
                other.inviterId == inviterId) &&
            (identical(other.inviterName, inviterName) ||
                other.inviterName == inviterName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, listId, listType, listName, inviterId, inviterName);

  /// Create a copy of ListInvite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListInviteImplCopyWith<_$ListInviteImpl> get copyWith =>
      __$$ListInviteImplCopyWithImpl<_$ListInviteImpl>(this, _$identity);
}

abstract class _ListInvite extends ListInvite {
  const factory _ListInvite(
      {required final String id,
      required final String listId,
      required final ListType listType,
      required final String listName,
      required final String inviterId,
      required final String inviterName}) = _$ListInviteImpl;
  const _ListInvite._() : super._();

  @override
  String get id;
  @override
  String get listId;
  @override
  ListType get listType;
  @override
  String get listName;
  @override
  String get inviterId;
  @override
  String get inviterName;

  /// Create a copy of ListInvite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListInviteImplCopyWith<_$ListInviteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
