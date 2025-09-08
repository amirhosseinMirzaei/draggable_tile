import 'package:flutter/material.dart';
import 'package:flutter_box_transform/flutter_box_transform.dart';
import 'package:reorderables/reorderables.dart';

import '../models/tile_model.dart';



class CameraGridPage extends StatefulWidget {
  const CameraGridPage({super.key});

  @override
  State<CameraGridPage> createState() => _CameraGridPageState();
}

class _CameraGridPageState extends State<CameraGridPage> {
  List<TileModel> items = [];

  void _addItem() {
    setState(() {
      items.add(TileModel(size: const Size(120, 120)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: ReorderableWrap(
          spacing: 8,
          runSpacing: 8,
          needsLongPressDraggable: true,
          onReorder: (oldIndex, newIndex) {
            setState(() {
              final item = items.removeAt(oldIndex);
              items.insert(newIndex, item);
            });
          },
          children: List.generate(items.length, (i) {
            final item = items[i];
            return SizedBox(
              width: item.size.width,
              height: item.size.height,
              child: TransformableBox(
                key: ValueKey(i),
                rect: Rect.fromLTWH(0, 0, item.size.width, item.size.height),
                clampingRect: Rect.fromLTWH(0, 0, 300, 300),
                onChanged: (result, event) {
                  setState(() {
                    items[i] = items[i].copyWith(size: result.rect.size);
                  });
                },
                contentBuilder: (context, rect, flip) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: rect.width,
                      height: rect.height,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[700],
                        border: Border.all(color: Colors.black26),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Icon(Icons.videocam, color: Colors.white, size: 36),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );

          }),
        ),
      ),
    );
  }
}
