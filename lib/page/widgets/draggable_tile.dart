import 'package:flutter/material.dart';

import '../../models/tile_model.dart';

class DraggableTile extends StatefulWidget {
  final TileModel tile;
  final Function(TileModel) onUpdate;
  final Function(TileModel) onBringToFront;

  const DraggableTile({super.key, required this.tile, required this.onUpdate, required this.onBringToFront});

  @override
  State<DraggableTile> createState() => _DraggableTileState();
}

class _DraggableTileState extends State<DraggableTile> {
  late double x, y, width, height;

  @override
  void initState() {
    super.initState();
    x = widget.tile.x;
    y = widget.tile.y;
    width = widget.tile.width;
    height = widget.tile.height;
  }

  void _updateTile() {
    widget.onUpdate(widget.tile.copyWith(x: x, y: y, width: width, height: height));
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: RepaintBoundary(
        // for better performance
        child: GestureDetector(
          onPanStart: (_) {
            widget.onBringToFront(widget.tile);
          },
          onPanUpdate: (details) {
            setState(() {
              x += details.delta.dx;
              y += details.delta.dy;
            });
            _updateTile();
          },
          child: Stack(
            children: [
              Container(width: width, height: height, decoration: BoxDecoration(color: widget.tile.color, borderRadius: BorderRadius.circular(12))),
              Positioned(
                right: 0,
                bottom: 0,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      width += details.delta.dx;
                      height += details.delta.dy;
                      if (width < 60) width = 60;
                      if (height < 60) height = 60;
                    });
                    _updateTile();
                  },
                  child: Container(width: 20, height: 20, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
