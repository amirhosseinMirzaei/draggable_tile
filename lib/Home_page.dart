import 'package:flutter/material.dart';
import 'draggable_tile.dart';
import 'grid_painter.dart';
import 'models/tile_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TileModel> _tiles = [
    TileModel(id: 1, x: 0, y: 0, width: 120, height: 120, color: Colors.red),
    TileModel(id: 2, x: 140, y: 0, width: 120, height: 120, color: Colors.blue),
    TileModel(id: 3, x: 0, y: 140, width: 120, height: 120, color: Colors.green),
  ];

  void _updateTile(TileModel updatedTile) {
    setState(() {
      final index = _tiles.indexWhere((t) => t.id == updatedTile.id);
      if (index != -1) {
        _tiles[index] = updatedTile;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: GridPainter(cellSize: 120),
        child: Stack(
          children:
              _tiles.map((tile) {
                return DraggableTile(key: ValueKey(tile.id), tile: tile, onUpdate: _updateTile);
              }).toList(),
        ),
      ),
    );
  }
}
