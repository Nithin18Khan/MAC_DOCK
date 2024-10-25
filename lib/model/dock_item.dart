//ANIMATION WHEN MOUSE TOUCH IT ANIMATED AND When dragging icons left or right, 
//they should  move from slot to slot with an animation


import 'package:flutter/material.dart';
import 'package:mac_dock/view/responsivenes.dart';

class DockItem extends StatefulWidget {
  const DockItem({
    Key? key,
    required this.icon,
    required this.responsive,
  }) : super(key: key);

  final IconData icon;
  final Responsive responsive;

  @override
  _DockItemState createState() => _DockItemState();
}

class _DockItemState extends State<DockItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.2 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: widget.responsive.scale(48),
          height: widget.responsive.scale(48),
          decoration: BoxDecoration(
            color: Colors.primaries[widget.icon.hashCode % Colors.primaries.length],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Icon(
              widget.icon,
              color: Colors.white,
              size: widget.responsive.getIconSize(),
            ),
          ),
        ),
      ),
    );
  }
}
