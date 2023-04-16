// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WordInfoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(WordInfo foo) success,
    required TResult Function(String foo) error,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(WordInfo foo)? success,
    TResult? Function(String foo)? error,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(WordInfo foo)? success,
    TResult Function(String foo)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WordInfoSuccessState value) success,
    required TResult Function(WordInfoErrorState value) error,
    required TResult Function(WordInfoLoadingState value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WordInfoSuccessState value)? success,
    TResult? Function(WordInfoErrorState value)? error,
    TResult? Function(WordInfoLoadingState value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WordInfoSuccessState value)? success,
    TResult Function(WordInfoErrorState value)? error,
    TResult Function(WordInfoLoadingState value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordInfoStateCopyWith<$Res> {
  factory $WordInfoStateCopyWith(
          WordInfoState value, $Res Function(WordInfoState) then) =
      _$WordInfoStateCopyWithImpl<$Res, WordInfoState>;
}

/// @nodoc
class _$WordInfoStateCopyWithImpl<$Res, $Val extends WordInfoState>
    implements $WordInfoStateCopyWith<$Res> {
  _$WordInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WordInfoSuccessStateCopyWith<$Res> {
  factory _$$WordInfoSuccessStateCopyWith(_$WordInfoSuccessState value,
          $Res Function(_$WordInfoSuccessState) then) =
      __$$WordInfoSuccessStateCopyWithImpl<$Res>;
  @useResult
  $Res call({WordInfo foo});
}

/// @nodoc
class __$$WordInfoSuccessStateCopyWithImpl<$Res>
    extends _$WordInfoStateCopyWithImpl<$Res, _$WordInfoSuccessState>
    implements _$$WordInfoSuccessStateCopyWith<$Res> {
  __$$WordInfoSuccessStateCopyWithImpl(_$WordInfoSuccessState _value,
      $Res Function(_$WordInfoSuccessState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foo = null,
  }) {
    return _then(_$WordInfoSuccessState(
      null == foo
          ? _value.foo
          : foo // ignore: cast_nullable_to_non_nullable
              as WordInfo,
    ));
  }
}

/// @nodoc

class _$WordInfoSuccessState implements WordInfoSuccessState {
  const _$WordInfoSuccessState(this.foo);

  @override
  final WordInfo foo;

  @override
  String toString() {
    return 'WordInfoState.success(foo: $foo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordInfoSuccessState &&
            (identical(other.foo, foo) || other.foo == foo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, foo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WordInfoSuccessStateCopyWith<_$WordInfoSuccessState> get copyWith =>
      __$$WordInfoSuccessStateCopyWithImpl<_$WordInfoSuccessState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(WordInfo foo) success,
    required TResult Function(String foo) error,
    required TResult Function() loading,
  }) {
    return success(foo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(WordInfo foo)? success,
    TResult? Function(String foo)? error,
    TResult? Function()? loading,
  }) {
    return success?.call(foo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(WordInfo foo)? success,
    TResult Function(String foo)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(foo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WordInfoSuccessState value) success,
    required TResult Function(WordInfoErrorState value) error,
    required TResult Function(WordInfoLoadingState value) loading,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WordInfoSuccessState value)? success,
    TResult? Function(WordInfoErrorState value)? error,
    TResult? Function(WordInfoLoadingState value)? loading,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WordInfoSuccessState value)? success,
    TResult Function(WordInfoErrorState value)? error,
    TResult Function(WordInfoLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class WordInfoSuccessState implements WordInfoState {
  const factory WordInfoSuccessState(final WordInfo foo) =
      _$WordInfoSuccessState;

  WordInfo get foo;
  @JsonKey(ignore: true)
  _$$WordInfoSuccessStateCopyWith<_$WordInfoSuccessState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WordInfoErrorStateCopyWith<$Res> {
  factory _$$WordInfoErrorStateCopyWith(_$WordInfoErrorState value,
          $Res Function(_$WordInfoErrorState) then) =
      __$$WordInfoErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String foo});
}

/// @nodoc
class __$$WordInfoErrorStateCopyWithImpl<$Res>
    extends _$WordInfoStateCopyWithImpl<$Res, _$WordInfoErrorState>
    implements _$$WordInfoErrorStateCopyWith<$Res> {
  __$$WordInfoErrorStateCopyWithImpl(
      _$WordInfoErrorState _value, $Res Function(_$WordInfoErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foo = null,
  }) {
    return _then(_$WordInfoErrorState(
      null == foo
          ? _value.foo
          : foo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WordInfoErrorState implements WordInfoErrorState {
  const _$WordInfoErrorState(this.foo);

  @override
  final String foo;

  @override
  String toString() {
    return 'WordInfoState.error(foo: $foo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordInfoErrorState &&
            (identical(other.foo, foo) || other.foo == foo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, foo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WordInfoErrorStateCopyWith<_$WordInfoErrorState> get copyWith =>
      __$$WordInfoErrorStateCopyWithImpl<_$WordInfoErrorState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(WordInfo foo) success,
    required TResult Function(String foo) error,
    required TResult Function() loading,
  }) {
    return error(foo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(WordInfo foo)? success,
    TResult? Function(String foo)? error,
    TResult? Function()? loading,
  }) {
    return error?.call(foo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(WordInfo foo)? success,
    TResult Function(String foo)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(foo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WordInfoSuccessState value) success,
    required TResult Function(WordInfoErrorState value) error,
    required TResult Function(WordInfoLoadingState value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WordInfoSuccessState value)? success,
    TResult? Function(WordInfoErrorState value)? error,
    TResult? Function(WordInfoLoadingState value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WordInfoSuccessState value)? success,
    TResult Function(WordInfoErrorState value)? error,
    TResult Function(WordInfoLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class WordInfoErrorState implements WordInfoState {
  const factory WordInfoErrorState(final String foo) = _$WordInfoErrorState;

  String get foo;
  @JsonKey(ignore: true)
  _$$WordInfoErrorStateCopyWith<_$WordInfoErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WordInfoLoadingStateCopyWith<$Res> {
  factory _$$WordInfoLoadingStateCopyWith(_$WordInfoLoadingState value,
          $Res Function(_$WordInfoLoadingState) then) =
      __$$WordInfoLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WordInfoLoadingStateCopyWithImpl<$Res>
    extends _$WordInfoStateCopyWithImpl<$Res, _$WordInfoLoadingState>
    implements _$$WordInfoLoadingStateCopyWith<$Res> {
  __$$WordInfoLoadingStateCopyWithImpl(_$WordInfoLoadingState _value,
      $Res Function(_$WordInfoLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WordInfoLoadingState implements WordInfoLoadingState {
  const _$WordInfoLoadingState();

  @override
  String toString() {
    return 'WordInfoState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WordInfoLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(WordInfo foo) success,
    required TResult Function(String foo) error,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(WordInfo foo)? success,
    TResult? Function(String foo)? error,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(WordInfo foo)? success,
    TResult Function(String foo)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WordInfoSuccessState value) success,
    required TResult Function(WordInfoErrorState value) error,
    required TResult Function(WordInfoLoadingState value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WordInfoSuccessState value)? success,
    TResult? Function(WordInfoErrorState value)? error,
    TResult? Function(WordInfoLoadingState value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WordInfoSuccessState value)? success,
    TResult Function(WordInfoErrorState value)? error,
    TResult Function(WordInfoLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class WordInfoLoadingState implements WordInfoState {
  const factory WordInfoLoadingState() = _$WordInfoLoadingState;
}
