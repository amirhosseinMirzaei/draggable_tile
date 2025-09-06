import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/tile_model.dart';

part 'tile_state.freezed.dart';

@freezed
class TileState with _$TileState {
  const factory TileState({
    required List<TileModel> tiles,
  }) = _TileState;
}
