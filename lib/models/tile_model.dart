import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tile_model.freezed.dart';

@freezed
class TileModel with _$TileModel {
  const factory TileModel({
    required int id,
    required double x,
    required double y,
    required double width,
    required double height,
    required Color color,
  }) = _TileModel;
}
