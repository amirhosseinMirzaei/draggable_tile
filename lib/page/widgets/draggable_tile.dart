import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/tile_bloc.dart';
import '../../bloc/tile_event.dart';
import '../../models/tile_model.dart';

class DraggableTile extends StatelessWidget {
  final TileModel tile;
  final double gridSize;

  const DraggableTile({
    super.key,
    required this.tile,
    this.gridSize = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: tile.x,
      top: tile.y,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onPanStart: (_) {
          final bloc = context.read<TileBloc>();
          bloc.add(TileEvent.bringToFront(tile));
        },
        onPanUpdate: (details) {
          final bloc = context.read<TileBloc>();
          final updated = tile.copyWith(
            x: tile.x + details.delta.dx,
            y: tile.y + details.delta.dy,
          );
          bloc.add(TileEvent.updateTile(updated));
        },
        child: Stack(
          children: [
            Container(
              width: tile.width,
              height: tile.height,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade700, width: 2),
              ),
              child: const Center(
                child: Icon(Icons.videocam, color: Colors.white, size: 36),
              ),
            ),

            Positioned(
              right: -6,
              top: 0,
              bottom: 0,
              child: MouseRegion(
                cursor: SystemMouseCursors.resizeLeftRight,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onPanUpdate: (details) {
                    final bloc = context.read<TileBloc>();
                    final newWidth =
                    (tile.width + details.delta.dx).clamp(80, 600);
                    final newHeight = newWidth * 9 / 16;
                    final updated = tile.copyWith(
                      width: newWidth.toDouble(),
                      height: newHeight,
                    );
                    bloc.add(TileEvent.updateTile(updated));
                  },
                  child: Container(
                    width: 12,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),


            Positioned(
              left: -6,
              top: 0,
              bottom: 0,
              child: MouseRegion(
                cursor: SystemMouseCursors.resizeLeftRight,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onPanUpdate: (details) {
                    final bloc = context.read<TileBloc>();
                    final newWidth =
                    (tile.width - details.delta.dx).clamp(80, 600);
                    final newHeight = newWidth * 9 / 16;
                    final updated = tile.copyWith(
                      x: tile.x + details.delta.dx,
                      width: newWidth.toDouble(),
                      height: newHeight,
                    );
                    bloc.add(TileEvent.updateTile(updated));
                  },
                  child: Container(
                    width: 12,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
