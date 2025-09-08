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
  Size get size => throw _privateConstructorUsedError;

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
  $Res call({Size size});
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
  $Res call({Object? size = null}) {
    return _then(
      _value.copyWith(
            size:
                null == size
                    ? _value.size
                    : size // ignore: cast_nullable_to_non_nullable
                        as Size,
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
  $Res call({Size size});
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
  $Res call({Object? size = null}) {
    return _then(
      _$TileModelImpl(
        size:
            null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                    as Size,
      ),
    );
  }
}

/// @nodoc

class _$TileModelImpl implements _TileModel {
  const _$TileModelImpl({required this.size});

  @override
  final Size size;

  @override
  String toString() {
    return 'TileModel(size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TileModelImpl &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(runtimeType, size);

  /// Create a copy of TileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TileModelImplCopyWith<_$TileModelImpl> get copyWith =>
      __$$TileModelImplCopyWithImpl<_$TileModelImpl>(this, _$identity);
}

abstract class _TileModel implements TileModel {
  const factory _TileModel({required final Size size}) = _$TileModelImpl;

  @override
  Size get size;

  /// Create a copy of TileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TileModelImplCopyWith<_$TileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
