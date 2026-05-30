import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:my_bottom_nav_bar/app_colors.dart';
import 'package:my_bottom_nav_bar/features/main/presentation/widgets/my_bottom_nav/interactive_glow_surface.dart';

class AddEventButton extends StatelessWidget {
  final double size;

  const AddEventButton({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(size / 2);
    return LiquidStretch(
      stretch: 0.5,
      interactionScale: 1.05,
      child: InteractiveGlowSurface(
        borderRadius: borderRadius,
        glowColor: AppColors.BASE_COLOR,
        maxOpacity: 0.32,
        child: LiquidGlass(
          shape: LiquidRoundedSuperellipse(borderRadius: size / 2),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: borderRadius,
              onTap: () {},
              child: SizedBox(
                height: size,
                width: size,
                child: GlassGlow(
                  glowColor: AppColors.BASE_COLOR.withValues(alpha: 0.35),
                  glowRadius: 1.2,
                  child: Icon(Icons.add, color: AppColors.BASE_COLOR, size: 28),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
