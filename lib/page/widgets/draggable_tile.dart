import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/tile_bloc.dart';
import '../../bloc/tile_event.dart';
import '../../models/tile_model.dart';

class DraggableTile extends StatelessWidget {
  final TileModel tile;
  final double gridSize;

  const DraggableTile({super.key, required this.tile, this.gridSize = 120});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: tile.x,
      top: tile.y,
      child: Listener(
        onPointerDown: (_) {},
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onPanStart: (_) {
            final bloc = context.read<TileBloc>();
            bloc.add(TileEvent.bringToFront(tile));
          },
          onPanUpdate: (details) {
            final bloc = context.read<TileBloc>();


            final newWidth = (tile.width + details.delta.dx).clamp(60, 400);


            final newHeight = newWidth * 9 / 16;

            final updated = tile.copyWith(
              width: newWidth.toDouble(),
              height: newHeight,
            );
            bloc.add(TileEvent.updateTile(updated));
          },

          onPanEnd: (_) {
            final bloc = context.read<TileBloc>();
            final snap = (double v) => (v / gridSize).round() * gridSize;
            final updated = tile.copyWith(
              x: snap(tile.x),
              y: snap(tile.y),
            );
            bloc.add(TileEvent.updateTile(updated));
          },
          child: Stack(
            children: [
              Container(
                width: tile.width,
                height: tile.height,
                decoration: BoxDecoration(
                  color: tile.color,
                  borderRadius: BorderRadius.circular(12),
                  border: tile.isSelected
                      ? Border.all(color: Colors.yellow, width: 3)
                      : null,
                ),
              ),
              // کنترل تغییر سایز
              Positioned(
                right: 0,
                bottom: 0,
                child: GestureDetector(

                  behavior: HitTestBehavior.translucent,
                  onPanUpdate: (details) {
                    final bloc = context.read<TileBloc>();
                    final newWidth = (tile.width + details.delta.dx).clamp(60, 400);
                    final newHeight = (tile.height + details.delta.dy).clamp(60, 400);


                    final scaleX = newWidth / tile.width;
                    final scaleY = newHeight / tile.height;

                    bloc.add(TileEvent.scaleAllTiles(
                      targetId: tile.id,
                      scaleX: scaleX,
                      scaleY: scaleY,
                    ));                  },

                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
