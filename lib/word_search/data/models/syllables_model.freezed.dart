// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'syllables_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SyllablesModel _$SyllablesModelFromJson(Map<String, dynamic> json) {
  return _SyllablesModel.fromJson(json);
}

/// @nodoc
mixin _$SyllablesModel {
  int get count => throw _privateConstructorUsedError;
  List<String> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyllablesModelCopyWith<SyllablesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyllablesModelCopyWith<$Res> {
  factory $SyllablesModelCopyWith(
          SyllablesModel value, $Res Function(SyllablesModel) then) =
      _$SyllablesModelCopyWithImpl<$Res, SyllablesModel>;
  @useResult
  $Res call({int count, List<String> list});
}

/// @nodoc
class _$SyllablesModelCopyWithImpl<$Res, $Val extends SyllablesModel>
    implements $SyllablesModelCopyWith<$Res> {
  _$SyllablesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SyllablesModelCopyWith<$Res>
    implements $SyllablesModelCopyWith<$Res> {
  factory _$$_SyllablesModelCopyWith(
          _$_SyllablesModel value, $Res Function(_$_SyllablesModel) then) =
      __$$_SyllablesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, List<String> list});
}

/// @nodoc
class __$$_SyllablesModelCopyWithImpl<$Res>
    extends _$SyllablesModelCopyWithImpl<$Res, _$_SyllablesModel>
    implements _$$_SyllablesModelCopyWith<$Res> {
  __$$_SyllablesModelCopyWithImpl(
      _$_SyllablesModel _value, $Res Function(_$_SyllablesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? list = null,
  }) {
    return _then(_$_SyllablesModel(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SyllablesModel implements _SyllablesModel {
  const _$_SyllablesModel(
      {required this.count, required final List<String> list})
      : _list = list;

  factory _$_SyllablesModel.fromJson(Map<String, dynamic> json) =>
      _$$_SyllablesModelFromJson(json);

  @override
  final int count;
  final List<String> _list;
  @override
  List<String> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'SyllablesModel(count: $count, list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SyllablesModel &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SyllablesModelCopyWith<_$_SyllablesModel> get copyWith =>
      __$$_SyllablesModelCopyWithImpl<_$_SyllablesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SyllablesModelToJson(
      this,
    );
  }
}

abstract class _SyllablesModel implements SyllablesModel {
  const factory _SyllablesModel(
      {required final int count,
      required final List<String> list}) = _$_SyllablesModel;

  factory _SyllablesModel.fromJson(Map<String, dynamic> json) =
      _$_SyllablesModel.fromJson;

  @override
  int get count;
  @override
  List<String> get list;
  @override
  @JsonKey(ignore: true)
  _$$_SyllablesModelCopyWith<_$_SyllablesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
