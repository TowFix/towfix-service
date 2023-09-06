// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String status, String message) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) network,
    required TResult Function(String message) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String status, String message)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? network,
    TResult? Function(String message)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String status, String message)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? network,
    TResult Function(String message)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Server value) server,
    required TResult Function(Cache value) cache,
    required TResult Function(Network value) network,
    required TResult Function(FException value) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Server value)? server,
    TResult? Function(Cache value)? cache,
    TResult? Function(Network value)? network,
    TResult? Function(FException value)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Server value)? server,
    TResult Function(Cache value)? cache,
    TResult Function(Network value)? network,
    TResult Function(FException value)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$ServerCopyWith(_$Server value, $Res Function(_$Server) then) =
      __$$ServerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message});
}

/// @nodoc
class __$$ServerCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res, _$Server>
    implements _$$ServerCopyWith<$Res> {
  __$$ServerCopyWithImpl(_$Server _value, $Res Function(_$Server) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_$Server(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Server implements Server {
  const _$Server({required this.status, required this.message});

  @override
  final String status;
  @override
  final String message;

  @override
  String toString() {
    return 'Failure.server(status: $status, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Server &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerCopyWith<_$Server> get copyWith =>
      __$$ServerCopyWithImpl<_$Server>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String status, String message) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) network,
    required TResult Function(String message) exception,
  }) {
    return server(status, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String status, String message)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? network,
    TResult? Function(String message)? exception,
  }) {
    return server?.call(status, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String status, String message)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? network,
    TResult Function(String message)? exception,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(status, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Server value) server,
    required TResult Function(Cache value) cache,
    required TResult Function(Network value) network,
    required TResult Function(FException value) exception,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Server value)? server,
    TResult? Function(Cache value)? cache,
    TResult? Function(Network value)? network,
    TResult? Function(FException value)? exception,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Server value)? server,
    TResult Function(Cache value)? cache,
    TResult Function(Network value)? network,
    TResult Function(FException value)? exception,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class Server implements Failure {
  const factory Server(
      {required final String status, required final String message}) = _$Server;

  String get status;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ServerCopyWith<_$Server> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CacheCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$CacheCopyWith(_$Cache value, $Res Function(_$Cache) then) =
      __$$CacheCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CacheCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res, _$Cache>
    implements _$$CacheCopyWith<$Res> {
  __$$CacheCopyWithImpl(_$Cache _value, $Res Function(_$Cache) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$Cache(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Cache implements Cache {
  const _$Cache({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.cache(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Cache &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheCopyWith<_$Cache> get copyWith =>
      __$$CacheCopyWithImpl<_$Cache>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String status, String message) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) network,
    required TResult Function(String message) exception,
  }) {
    return cache(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String status, String message)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? network,
    TResult? Function(String message)? exception,
  }) {
    return cache?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String status, String message)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? network,
    TResult Function(String message)? exception,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Server value) server,
    required TResult Function(Cache value) cache,
    required TResult Function(Network value) network,
    required TResult Function(FException value) exception,
  }) {
    return cache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Server value)? server,
    TResult? Function(Cache value)? cache,
    TResult? Function(Network value)? network,
    TResult? Function(FException value)? exception,
  }) {
    return cache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Server value)? server,
    TResult Function(Cache value)? cache,
    TResult Function(Network value)? network,
    TResult Function(FException value)? exception,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(this);
    }
    return orElse();
  }
}

abstract class Cache implements Failure {
  const factory Cache({required final String message}) = _$Cache;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$CacheCopyWith<_$Cache> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$NetworkCopyWith(_$Network value, $Res Function(_$Network) then) =
      __$$NetworkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$Network>
    implements _$$NetworkCopyWith<$Res> {
  __$$NetworkCopyWithImpl(_$Network _value, $Res Function(_$Network) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$Network(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Network implements Network {
  const _$Network({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.network(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Network &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkCopyWith<_$Network> get copyWith =>
      __$$NetworkCopyWithImpl<_$Network>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String status, String message) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) network,
    required TResult Function(String message) exception,
  }) {
    return network(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String status, String message)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? network,
    TResult? Function(String message)? exception,
  }) {
    return network?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String status, String message)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? network,
    TResult Function(String message)? exception,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Server value) server,
    required TResult Function(Cache value) cache,
    required TResult Function(Network value) network,
    required TResult Function(FException value) exception,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Server value)? server,
    TResult? Function(Cache value)? cache,
    TResult? Function(Network value)? network,
    TResult? Function(FException value)? exception,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Server value)? server,
    TResult Function(Cache value)? cache,
    TResult Function(Network value)? network,
    TResult Function(FException value)? exception,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class Network implements Failure {
  const factory Network({required final String message}) = _$Network;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$NetworkCopyWith<_$Network> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FExceptionCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$FExceptionCopyWith(
          _$FException value, $Res Function(_$FException) then) =
      __$$FExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FExceptionCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$FException>
    implements _$$FExceptionCopyWith<$Res> {
  __$$FExceptionCopyWithImpl(
      _$FException _value, $Res Function(_$FException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FException(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FException implements FException {
  const _$FException({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.exception(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FException &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FExceptionCopyWith<_$FException> get copyWith =>
      __$$FExceptionCopyWithImpl<_$FException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String status, String message) server,
    required TResult Function(String message) cache,
    required TResult Function(String message) network,
    required TResult Function(String message) exception,
  }) {
    return exception(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String status, String message)? server,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? network,
    TResult? Function(String message)? exception,
  }) {
    return exception?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String status, String message)? server,
    TResult Function(String message)? cache,
    TResult Function(String message)? network,
    TResult Function(String message)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Server value) server,
    required TResult Function(Cache value) cache,
    required TResult Function(Network value) network,
    required TResult Function(FException value) exception,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Server value)? server,
    TResult? Function(Cache value)? cache,
    TResult? Function(Network value)? network,
    TResult? Function(FException value)? exception,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Server value)? server,
    TResult Function(Cache value)? cache,
    TResult Function(Network value)? network,
    TResult Function(FException value)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class FException implements Failure {
  const factory FException({required final String message}) = _$FException;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$FExceptionCopyWith<_$FException> get copyWith =>
      throw _privateConstructorUsedError;
}
