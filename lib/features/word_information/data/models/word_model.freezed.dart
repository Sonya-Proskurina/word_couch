// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WordModel _$WordModelFromJson(Map<String, dynamic> json) {
  return _WordModel.fromJson(json);
}

/// @nodoc
mixin _$WordModel {
  @JsonKey(name: 'results')
  List<WordMeaningModel> get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'syllables')
  SyllablesModel? get syllables => throw _privateConstructorUsedError;
  @JsonKey(name: 'pronunciation')
  Map<String, String>? get pronunciation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordModelCopyWith<WordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordModelCopyWith<$Res> {
  factory $WordModelCopyWith(WordModel value, $Res Function(WordModel) then) =
      _$WordModelCopyWithImpl<$Res, WordModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'results') List<WordMeaningModel> results,
      @JsonKey(name: 'syllables') SyllablesModel? syllables,
      @JsonKey(name: 'pronunciation') Map<String, String>? pronunciation});

  $SyllablesModelCopyWith<$Res>? get syllables;
}

/// @nodoc
class _$WordModelCopyWithImpl<$Res, $Val extends WordModel>
    implements $WordModelCopyWith<$Res> {
  _$WordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? syllables = freezed,
    Object? pronunciation = freezed,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<WordMeaningModel>,
      syllables: freezed == syllables
          ? _value.syllables
          : syllables // ignore: cast_nullable_to_non_nullable
              as SyllablesModel?,
      pronunciation: freezed == pronunciation
          ? _value.pronunciation
          : pronunciation // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SyllablesModelCopyWith<$Res>? get syllables {
    if (_value.syllables == null) {
      return null;
    }

    return $SyllablesModelCopyWith<$Res>(_value.syllables!, (value) {
      return _then(_value.copyWith(syllables: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WordModelCopyWith<$Res> implements $WordModelCopyWith<$Res> {
  factory _$$_WordModelCopyWith(
          _$_WordModel value, $Res Function(_$_WordModel) then) =
      __$$_WordModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'results') List<WordMeaningModel> results,
      @JsonKey(name: 'syllables') SyllablesModel? syllables,
      @JsonKey(name: 'pronunciation') Map<String, String>? pronunciation});

  @override
  $SyllablesModelCopyWith<$Res>? get syllables;
}

/// @nodoc
class __$$_WordModelCopyWithImpl<$Res>
    extends _$WordModelCopyWithImpl<$Res, _$_WordModel>
    implements _$$_WordModelCopyWith<$Res> {
  __$$_WordModelCopyWithImpl(
      _$_WordModel _value, $Res Function(_$_WordModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? syllables = freezed,
    Object? pronunciation = freezed,
  }) {
    return _then(_$_WordModel(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<WordMeaningModel>,
      syllables: freezed == syllables
          ? _value.syllables
          : syllables // ignore: cast_nullable_to_non_nullable
              as SyllablesModel?,
      pronunciation: freezed == pronunciation
          ? _value._pronunciation
          : pronunciation // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WordModel implements _WordModel {
  const _$_WordModel(
      {@JsonKey(name: 'results')
          required final List<WordMeaningModel> results,
      @JsonKey(name: 'syllables')
          required this.syllables,
      @JsonKey(name: 'pronunciation')
          required final Map<String, String>? pronunciation})
      : _results = results,
        _pronunciation = pronunciation;

  factory _$_WordModel.fromJson(Map<String, dynamic> json) =>
      _$$_WordModelFromJson(json);

  final List<WordMeaningModel> _results;
  @override
  @JsonKey(name: 'results')
  List<WordMeaningModel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey(name: 'syllables')
  final SyllablesModel? syllables;
  final Map<String, String>? _pronunciation;
  @override
  @JsonKey(name: 'pronunciation')
  Map<String, String>? get pronunciation {
    final value = _pronunciation;
    if (value == null) return null;
    if (_pronunciation is EqualUnmodifiableMapView) return _pronunciation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'WordModel(results: $results, syllables: $syllables, pronunciation: $pronunciation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordModel &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.syllables, syllables) ||
                other.syllables == syllables) &&
            const DeepCollectionEquality()
                .equals(other._pronunciation, _pronunciation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_results),
      syllables,
      const DeepCollectionEquality().hash(_pronunciation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordModelCopyWith<_$_WordModel> get copyWith =>
      __$$_WordModelCopyWithImpl<_$_WordModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordModelToJson(
      this,
    );
  }
}

abstract class _WordModel implements WordModel {
  const factory _WordModel(
      {@JsonKey(name: 'results')
          required final List<WordMeaningModel> results,
      @JsonKey(name: 'syllables')
          required final SyllablesModel? syllables,
      @JsonKey(name: 'pronunciation')
          required final Map<String, String>? pronunciation}) = _$_WordModel;

  factory _WordModel.fromJson(Map<String, dynamic> json) =
      _$_WordModel.fromJson;

  @override
  @JsonKey(name: 'results')
  List<WordMeaningModel> get results;
  @override
  @JsonKey(name: 'syllables')
  SyllablesModel? get syllables;
  @override
  @JsonKey(name: 'pronunciation')
  Map<String, String>? get pronunciation;
  @override
  @JsonKey(ignore: true)
  _$$_WordModelCopyWith<_$_WordModel> get copyWith =>
      throw _privateConstructorUsedError;
}
