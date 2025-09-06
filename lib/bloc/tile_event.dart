import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/tile_model.dart';

part 'tile_event.freezed.dart';

@freezed
class TileEvent with _$TileEvent {
  const factory TileEvent.loadTiles() = LoadTiles;
  const factory TileEvent.updateTile(TileModel tile) = UpdateTile;
  const factory TileEvent.bringToFront(TileModel tile) = BringToFront;
}
