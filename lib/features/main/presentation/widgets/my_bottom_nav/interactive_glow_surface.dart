import 'package:flutter/material.dart';

class InteractiveGlowSurface extends StatefulWidget {
  final Widget child;
  final BorderRadius borderRadius;
  final Color glowColor;
  final double maxOpacity;

  const InteractiveGlowSurface({
    super.key,
    required this.child,
    required this.borderRadius,
    required this.glowColor,
    this.maxOpacity = 0.25,
  });

  @override
  State<InteractiveGlowSurface> createState() =>
      _InteractiveGlowSurfaceState();
}

class _InteractiveGlowSurfaceState extends State<InteractiveGlowSurface> {
  Offset? _pointerPosition;
  bool _isActive = false;

  void _updatePointer(Offset position) {
    setState(() {
      _pointerPosition = position;
      _isActive = true;
    });
  }

  void _clearPointer() {
    if (!_isActive) return;
    setState(() {
      _isActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest;
        final alignment = _pointerPosition == null || size.width == 0
            ? Alignment.center
            : Alignment(
                (_pointerPosition!.dx / size.width) * 2 - 1,
                (_pointerPosition!.dy / size.height) * 2 - 1,
              );

        return ClipRRect(
          borderRadius: widget.borderRadius,
          child: Stack(
            children: [
              Listener(
                behavior: HitTestBehavior.translucent,
                onPointerDown: (event) => _updatePointer(event.localPosition),
                onPointerMove: (event) => _updatePointer(event.localPosition),
                onPointerUp: (_) => _clearPointer(),
                onPointerCancel: (_) => _clearPointer(),
                child: widget.child,
              ),
              Positioned.fill(
                child: IgnorePointer(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 180),
                    opacity: _isActive ? 1 : 0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 120),
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          center: alignment,
                          radius: 0.9,
                          colors: [
                            widget.glowColor.withOpacity(widget.maxOpacity),
                            widget.glowColor.withOpacity(0.0),
                          ],
                          stops: const [0.0, 1.0],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
