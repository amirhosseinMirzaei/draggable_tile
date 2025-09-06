import 'package:flutter/material.dart';
import 'draggable_tile.dart';
import 'models/tile_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TileModel> tiles = [
    TileModel(id: 1, x: 0, y: 0, width: 120, height: 120, color: Colors.red),
    TileModel(id: 2, x: 140, y: 0, width: 120, height: 120, color: Colors.blue),
    TileModel(id: 3, x: 0, y: 140, width: 120, height: 120, color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:
            tiles.map((tile) {
              return DraggableTile(
                key: ValueKey(tile.id),
                tile: tile,
                onUpdate: (updatedTile) {
                  setState(() {
                    final index = tiles.indexWhere((t) => t.id == updatedTile.id);
                    tiles[index] = updatedTile;
                  });
                },
              );
            }).toList(),
      ),
    );
  }
}
