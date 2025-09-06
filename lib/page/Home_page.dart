import 'package:draggable_grid/page/widgets/draggable_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/tile_bloc.dart';
import '../bloc/tile_event.dart';
import '../bloc/tile_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TileBloc(),
      child: Scaffold(
        body: BlocBuilder<TileBloc, TileState>(
          builder: (context, state) {
            return Stack(
              children:
                  state.tiles.map((tile) {
                    return DraggableTile(
                      key: ValueKey(tile.id),
                      tile: tile,
                      onUpdate: (updatedTile) {
                        context.read<TileBloc>().add(TileEvent.updateTile(updatedTile));
                      },
                      onBringToFront: (tile) {
                        context.read<TileBloc>().add(TileEvent.bringToFront(tile));
                      },
                    );
                  }).toList(),
            );
          },
        ),
      ),
    );
  }
}
