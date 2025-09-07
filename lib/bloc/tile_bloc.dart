import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'tile_event.dart';
import 'tile_state.dart';
import '../models/tile_model.dart';

class TileBloc extends Bloc<TileEvent, TileState> {
  TileBloc()
      : super(TileState(tiles: [


  ])) {
    on<UpdateTile>((event, emit) {
      final updatedTiles = state.tiles
          .map((t) => t.id == event.tile.id ? event.tile : t)
          .toList();
      emit(state.copyWith(tiles: updatedTiles));
    });

    on<BringToFront>((event, emit) {
      final tiles = List<TileModel>.from(state.tiles);
      tiles.removeWhere((t) => t.id == event.tile.id);
      tiles.add(event.tile);
      emit(state.copyWith(tiles: tiles));
    });

    on<ToggleTileSelection>((event, emit) {
      final updatedTiles = state.tiles.map((t) {
        if (t.id == event.tileId) {
          return t.copyWith(isSelected: !t.isSelected);
        }
        return t;
      }).toList();
      emit(state.copyWith(tiles: updatedTiles));
    });

    on<AddTile>((event, emit) {
      final updatedTiles = List<TileModel>.from(state.tiles)..add(event.tile);
      emit(state.copyWith(tiles: updatedTiles));
    });


    on<ScaleAllTiles>((event, emit) {
      final updated = state.tiles.map((t) {
        if (t.id == event.targetId) {

          return t.copyWith(
            width: (t.width * event.scaleX).clamp(60, 600),
            height: (t.height * event.scaleY).clamp(60, 600),
          );
        } else {

          return t.copyWith(
            width: (t.width / event.scaleX).clamp(40, 400),
            height: (t.height / event.scaleY).clamp(40, 400),
          );
        }
      }).toList();

      emit(state.copyWith(tiles: updated));
    });
  }
}
