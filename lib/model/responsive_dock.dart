import 'package:flutter/material.dart';
import 'package:mac_dock/model/dock_item.dart';
import 'package:mac_dock/view/responsivenes.dart';

class ResponsiveDock<T> extends StatefulWidget {
  const ResponsiveDock({
    super.key,
    required this.items,
    required this.responsive,
  });

  final List<T> items;
  final Responsive responsive;

  @override
  State<ResponsiveDock<T>> createState() => _ResponsiveDockState<T>();
}

class _ResponsiveDockState<T> extends State<ResponsiveDock<T>> {
  late List<T> _items = widget.items.toList();
  int? _draggingIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.responsive.getPadding(),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_items.length, (index) {
          final item = _items[index];
          return GestureDetector(
            onPanStart: (_) => setState(() => _draggingIndex = index),
            onPanUpdate: (details) {
              final newIndex = _calculateNewIndex(details.localPosition.dx);
              if (newIndex != _draggingIndex && newIndex < _items.length) {
                setState(() {
                  final movedItem = _items.removeAt(_draggingIndex!);
                  _items.insert(newIndex, movedItem);
                  _draggingIndex = newIndex;
                });
              }
            },
            onPanEnd: (_) => setState(() => _draggingIndex = null),
            child: DockItem(
              icon: item as IconData,
              responsive: widget.responsive,
            ),
          );
        }),
      ),
    );
  }

  int _calculateNewIndex(double dragPosition) {
    final itemWidth = widget.responsive.scale(64);
    return (dragPosition / itemWidth).clamp(0, _items.length - 1).toInt();
  }
}