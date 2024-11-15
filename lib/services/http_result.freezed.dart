// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'http_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HttpResult {
  String get uri => throw _privateConstructorUsedError;
  String get response => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;

  /// Create a copy of HttpResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HttpResultCopyWith<HttpResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpResultCopyWith<$Res> {
  factory $HttpResultCopyWith(
          HttpResult value, $Res Function(HttpResult) then) =
      _$HttpResultCopyWithImpl<$Res, HttpResult>;
  @useResult
  $Res call({String uri, String response, int statusCode});
}

/// @nodoc
class _$HttpResultCopyWithImpl<$Res, $Val extends HttpResult>
    implements $HttpResultCopyWith<$Res> {
  _$HttpResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HttpResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
    Object? response = null,
    Object? statusCode = null,
  }) {
    return _then(_value.copyWith(
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HttpResultImplCopyWith<$Res>
    implements $HttpResultCopyWith<$Res> {
  factory _$$HttpResultImplCopyWith(
          _$HttpResultImpl value, $Res Function(_$HttpResultImpl) then) =
      __$$HttpResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uri, String response, int statusCode});
}

/// @nodoc
class __$$HttpResultImplCopyWithImpl<$Res>
    extends _$HttpResultCopyWithImpl<$Res, _$HttpResultImpl>
    implements _$$HttpResultImplCopyWith<$Res> {
  __$$HttpResultImplCopyWithImpl(
      _$HttpResultImpl _value, $Res Function(_$HttpResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of HttpResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
    Object? response = null,
    Object? statusCode = null,
  }) {
    return _then(_$HttpResultImpl(
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HttpResultImpl extends _HttpResult {
  const _$HttpResultImpl(
      {required this.uri, required this.response, required this.statusCode})
      : super._();

  @override
  final String uri;
  @override
  final String response;
  @override
  final int statusCode;

  @override
  String toString() {
    return 'HttpResult(uri: $uri, response: $response, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpResultImpl &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uri, response, statusCode);

  /// Create a copy of HttpResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HttpResultImplCopyWith<_$HttpResultImpl> get copyWith =>
      __$$HttpResultImplCopyWithImpl<_$HttpResultImpl>(this, _$identity);
}

abstract class _HttpResult extends HttpResult {
  const factory _HttpResult(
      {required final String uri,
      required final String response,
      required final int statusCode}) = _$HttpResultImpl;
  const _HttpResult._() : super._();

  @override
  String get uri;
  @override
  String get response;
  @override
  int get statusCode;

  /// Create a copy of HttpResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HttpResultImplCopyWith<_$HttpResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
