// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TileModel {
  int get id => throw _privateConstructorUsedError;
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;

  /// Create a copy of TileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TileModelCopyWith<TileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TileModelCopyWith<$Res> {
  factory $TileModelCopyWith(TileModel value, $Res Function(TileModel) then) =
      _$TileModelCopyWithImpl<$Res, TileModel>;
  @useResult
  $Res call({
    int id,
    double x,
    double y,
    double width,
    double height,
    Color color,
  });
}

/// @nodoc
class _$TileModelCopyWithImpl<$Res, $Val extends TileModel>
    implements $TileModelCopyWith<$Res> {
  _$TileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? x = null,
    Object? y = null,
    Object? width = null,
    Object? height = null,
    Object? color = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            x:
                null == x
                    ? _value.x
                    : x // ignore: cast_nullable_to_non_nullable
                        as double,
            y:
                null == y
                    ? _value.y
                    : y // ignore: cast_nullable_to_non_nullable
                        as double,
            width:
                null == width
                    ? _value.width
                    : width // ignore: cast_nullable_to_non_nullable
                        as double,
            height:
                null == height
                    ? _value.height
                    : height // ignore: cast_nullable_to_non_nullable
                        as double,
            color:
                null == color
                    ? _value.color
                    : color // ignore: cast_nullable_to_non_nullable
                        as Color,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TileModelImplCopyWith<$Res>
    implements $TileModelCopyWith<$Res> {
  factory _$$TileModelImplCopyWith(
    _$TileModelImpl value,
    $Res Function(_$TileModelImpl) then,
  ) = __$$TileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    double x,
    double y,
    double width,
    double height,
    Color color,
  });
}

/// @nodoc
class __$$TileModelImplCopyWithImpl<$Res>
    extends _$TileModelCopyWithImpl<$Res, _$TileModelImpl>
    implements _$$TileModelImplCopyWith<$Res> {
  __$$TileModelImplCopyWithImpl(
    _$TileModelImpl _value,
    $Res Function(_$TileModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? x = null,
    Object? y = null,
    Object? width = null,
    Object? height = null,
    Object? color = null,
  }) {
    return _then(
      _$TileModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        x:
            null == x
                ? _value.x
                : x // ignore: cast_nullable_to_non_nullable
                    as double,
        y:
            null == y
                ? _value.y
                : y // ignore: cast_nullable_to_non_nullable
                    as double,
        width:
            null == width
                ? _value.width
                : width // ignore: cast_nullable_to_non_nullable
                    as double,
        height:
            null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                    as double,
        color:
            null == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                    as Color,
      ),
    );
  }
}

/// @nodoc

class _$TileModelImpl implements _TileModel {
  const _$TileModelImpl({
    required this.id,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  final int id;
  @override
  final double x;
  @override
  final double y;
  @override
  final double width;
  @override
  final double height;
  @override
  final Color color;

  @override
  String toString() {
    return 'TileModel(id: $id, x: $x, y: $y, width: $width, height: $height, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TileModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, x, y, width, height, color);

  /// Create a copy of TileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TileModelImplCopyWith<_$TileModelImpl> get copyWith =>
      __$$TileModelImplCopyWithImpl<_$TileModelImpl>(this, _$identity);
}

abstract class _TileModel implements TileModel {
  const factory _TileModel({
    required final int id,
    required final double x,
    required final double y,
    required final double width,
    required final double height,
    required final Color color,
  }) = _$TileModelImpl;

  @override
  int get id;
  @override
  double get x;
  @override
  double get y;
  @override
  double get width;
  @override
  double get height;
  @override
  Color get color;

  /// Create a copy of TileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TileModelImplCopyWith<_$TileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
