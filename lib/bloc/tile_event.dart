import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/tile_model.dart';

part 'tile_event.freezed.dart';

@freezed
class TileEvent with _$TileEvent {
  const factory TileEvent.loadTiles() = LoadTiles;
  const factory TileEvent.updateTile(TileModel tile) = UpdateTile;
  const factory TileEvent.bringToFront(TileModel tile) = BringToFront;
  const factory TileEvent.toggleTileSelection(int tileId) = ToggleTileSelection;
  const factory TileEvent.addTile(TileModel tile) = AddTile;

  const factory TileEvent.scaleAllTiles({
    required int targetId,
    required double scaleX,
    required double scaleY,
  }) = ScaleAllTiles;
}
