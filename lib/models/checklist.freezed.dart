// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Checklist _$ChecklistFromJson(Map<String, dynamic> json) {
  return _Checklist.fromJson(json);
}

/// @nodoc
mixin _$Checklist {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  User get owner => throw _privateConstructorUsedError;
  List<String> get editorIds => throw _privateConstructorUsedError;
  List<User> get editors => throw _privateConstructorUsedError;
  List<ChecklistItem> get items => throw _privateConstructorUsedError;

  /// Serializes this Checklist to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Checklist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecklistCopyWith<Checklist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistCopyWith<$Res> {
  factory $ChecklistCopyWith(Checklist value, $Res Function(Checklist) then) =
      _$ChecklistCopyWithImpl<$Res, Checklist>;
  @useResult
  $Res call(
      {String id,
      String name,
      String ownerId,
      User owner,
      List<String> editorIds,
      List<User> editors,
      List<ChecklistItem> items});

  $UserCopyWith<$Res> get owner;
}

/// @nodoc
class _$ChecklistCopyWithImpl<$Res, $Val extends Checklist>
    implements $ChecklistCopyWith<$Res> {
  _$ChecklistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Checklist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ownerId = null,
    Object? owner = null,
    Object? editorIds = null,
    Object? editors = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
      editorIds: null == editorIds
          ? _value.editorIds
          : editorIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      editors: null == editors
          ? _value.editors
          : editors // ignore: cast_nullable_to_non_nullable
              as List<User>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ChecklistItem>,
    ) as $Val);
  }

  /// Create a copy of Checklist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get owner {
    return $UserCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChecklistImplCopyWith<$Res>
    implements $ChecklistCopyWith<$Res> {
  factory _$$ChecklistImplCopyWith(
          _$ChecklistImpl value, $Res Function(_$ChecklistImpl) then) =
      __$$ChecklistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String ownerId,
      User owner,
      List<String> editorIds,
      List<User> editors,
      List<ChecklistItem> items});

  @override
  $UserCopyWith<$Res> get owner;
}

/// @nodoc
class __$$ChecklistImplCopyWithImpl<$Res>
    extends _$ChecklistCopyWithImpl<$Res, _$ChecklistImpl>
    implements _$$ChecklistImplCopyWith<$Res> {
  __$$ChecklistImplCopyWithImpl(
      _$ChecklistImpl _value, $Res Function(_$ChecklistImpl) _then)
      : super(_value, _then);

  /// Create a copy of Checklist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ownerId = null,
    Object? owner = null,
    Object? editorIds = null,
    Object? editors = null,
    Object? items = null,
  }) {
    return _then(_$ChecklistImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
      editorIds: null == editorIds
          ? _value._editorIds
          : editorIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      editors: null == editors
          ? _value._editors
          : editors // ignore: cast_nullable_to_non_nullable
              as List<User>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ChecklistItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecklistImpl extends _Checklist {
  const _$ChecklistImpl(
      {required this.id,
      required this.name,
      required this.ownerId,
      required this.owner,
      required final List<String> editorIds,
      required final List<User> editors,
      required final List<ChecklistItem> items})
      : _editorIds = editorIds,
        _editors = editors,
        _items = items,
        super._();

  factory _$ChecklistImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChecklistImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String ownerId;
  @override
  final User owner;
  final List<String> _editorIds;
  @override
  List<String> get editorIds {
    if (_editorIds is EqualUnmodifiableListView) return _editorIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_editorIds);
  }

  final List<User> _editors;
  @override
  List<User> get editors {
    if (_editors is EqualUnmodifiableListView) return _editors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_editors);
  }

  final List<ChecklistItem> _items;
  @override
  List<ChecklistItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Checklist(id: $id, name: $name, ownerId: $ownerId, owner: $owner, editorIds: $editorIds, editors: $editors, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            const DeepCollectionEquality()
                .equals(other._editorIds, _editorIds) &&
            const DeepCollectionEquality().equals(other._editors, _editors) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      ownerId,
      owner,
      const DeepCollectionEquality().hash(_editorIds),
      const DeepCollectionEquality().hash(_editors),
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of Checklist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistImplCopyWith<_$ChecklistImpl> get copyWith =>
      __$$ChecklistImplCopyWithImpl<_$ChecklistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecklistImplToJson(
      this,
    );
  }
}

abstract class _Checklist extends Checklist {
  const factory _Checklist(
      {required final String id,
      required final String name,
      required final String ownerId,
      required final User owner,
      required final List<String> editorIds,
      required final List<User> editors,
      required final List<ChecklistItem> items}) = _$ChecklistImpl;
  const _Checklist._() : super._();

  factory _Checklist.fromJson(Map<String, dynamic> json) =
      _$ChecklistImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get ownerId;
  @override
  User get owner;
  @override
  List<String> get editorIds;
  @override
  List<User> get editors;
  @override
  List<ChecklistItem> get items;

  /// Create a copy of Checklist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecklistImplCopyWith<_$ChecklistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
