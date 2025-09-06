import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/tile_bloc.dart';
import '../../bloc/tile_event.dart';
import '../../models/tile_model.dart';

class DraggableTile extends StatelessWidget {
  final TileModel tile;

  const DraggableTile({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: tile.x,
      top: tile.y,
      child: RepaintBoundary(
        child: GestureDetector(
          // انتخاب / deselect
          onTap: () {
            context.read<TileBloc>().add(TileEvent.toggleTileSelection(tile.id));
          },

          // شروع Drag
          onPanStart: (_) {
            final bloc = context.read<TileBloc>();
            final selectedTiles = bloc.state.tiles.where((t) => t.isSelected).toList();

            if (tile.isSelected) {
              for (var t in selectedTiles) {
                bloc.add(TileEvent.bringToFront(t));
              }
            } else {
              bloc.add(TileEvent.bringToFront(tile));
            }
          },

          // Drag کردن
          onPanUpdate: (details) {
            final bloc = context.read<TileBloc>();
            final selectedTiles = bloc.state.tiles.where((t) => t.isSelected).toList();

            if (tile.isSelected) {
              for (var t in selectedTiles) {
                final updated = t.copyWith(
                  x: t.x + details.delta.dx,
                  y: t.y + details.delta.dy,
                );
                bloc.add(TileEvent.updateTile(updated));
              }
            } else {
              final updated = tile.copyWith(
                x: tile.x + details.delta.dx,
                y: tile.y + details.delta.dy,
              );
              bloc.add(TileEvent.updateTile(updated));
            }
          },

          child: Stack(
            children: [
              // بدنه اصلی تایل
              Container(
                width: tile.width,
                height: tile.height,
                decoration: BoxDecoration(
                  color: tile.isSelected ? Colors.orange : tile.color,
                  borderRadius: BorderRadius.circular(12),
                  border: tile.isSelected ? Border.all(color: Colors.yellow, width: 3) : null,
                ),
              ),

              // دستگیره Resize
              Positioned(
                right: 0,
                bottom: 0,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    final bloc = context.read<TileBloc>();
                    final updated = tile.copyWith(
                      width: (tile.width + details.delta.dx).clamp(60, double.infinity),
                      height: (tile.height + details.delta.dy).clamp(60, double.infinity),
                    );
                    bloc.add(TileEvent.updateTile(updated));
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
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
