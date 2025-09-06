import 'package:flutter_bloc/flutter_bloc.dart';
import 'tile_event.dart';
import 'tile_state.dart';
import '../models/tile_model.dart';
import 'package:flutter/material.dart';

class TileBloc extends Bloc<TileEvent, TileState> {
  TileBloc()
    : super(
        TileState(
          tiles: [
            TileModel(id: 1, x: 0, y: 0, width: 120, height: 120, color: Colors.purple),
            TileModel(id: 2, x: 140, y: 0, width: 120, height: 120, color: Colors.greenAccent),
            TileModel(id: 3, x: 0, y: 140, width: 120, height: 120, color: Colors.tealAccent),
          ],
        ),
      ) {
    on<UpdateTile>((event, emit) {
      final updatedTiles = state.tiles.map((t) => t.id == event.tile.id ? event.tile : t).toList();
      emit(state.copyWith(tiles: updatedTiles));
    });

    on<BringToFront>((event, emit) {
      final tiles = List<TileModel>.from(state.tiles);
      tiles.removeWhere((t) => t.id == event.tile.id);
      tiles.add(event.tile);
      emit(state.copyWith(tiles: tiles));
    });
  }
}
