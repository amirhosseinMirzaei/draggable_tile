import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/tile_bloc.dart';
import '../bloc/tile_event.dart';
import '../bloc/tile_state.dart';
import '../models/tile_model.dart';
import 'package:draggable_grid/page/widgets/draggable_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TileBloc tileBloc;

  @override
  void initState() {
    super.initState();
    tileBloc = TileBloc();
  }

  @override
  void dispose() {
    tileBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: tileBloc,
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return BlocBuilder<TileBloc, TileState>(
              builder: (context, state) {
                final count = state.tiles.length;
                if (count == 0) return const SizedBox();

                // محاسبه تعداد ستون و ردیف نزدیک‌ترین مربع
                int columns = sqrt(count).ceil();
                int rows = (count / columns).ceil();

                final tileWidth = constraints.maxWidth / columns;
                final tileHeight = tileWidth * 9 / 16; // Aspect Ratio 16:9

                return Stack(
                  children:
                      state.tiles.map((tile) {
                        final index = state.tiles.indexOf(tile);
                        final col = index % columns;
                        final row = index ~/ columns;

                        return DraggableTile(
                          key: ValueKey(tile.id),
                          tile: tile.copyWith(x: col * tileWidth, y: row * tileHeight, width: tileWidth, height: tileHeight),
                          gridSize: tileWidth,
                        );
                      }).toList(),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final bloc = tileBloc;
            final state = bloc.state;
            final maxWidth = MediaQuery.of(context).size.width;

            final columns = (maxWidth ~/ 120).clamp(1, 10);
            final tileWidth = maxWidth / columns;
            final tileHeight = tileWidth * 9 / 16; // Aspect Ratio 16:9

            final newId = state.tiles.isEmpty ? 1 : state.tiles.map((t) => t.id).reduce((a, b) => a > b ? a : b) + 1;

            final col = (newId - 1) % columns;
            final row = (newId - 1) ~/ columns;

            final newTile = TileModel(
              id: newId,
              x: col * tileWidth,
              y: row * tileHeight,
              width: tileWidth,
              height: tileHeight,
              color: Colors.primaries[newId % Colors.primaries.length],
            );

            bloc.add(TileEvent.addTile(newTile));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
