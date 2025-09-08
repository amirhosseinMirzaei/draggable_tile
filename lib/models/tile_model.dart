import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tile_model.freezed.dart';

@freezed
class TileModel with _$TileModel {
  const factory TileModel({
    required Size size,
  }) = _TileModel;
}
