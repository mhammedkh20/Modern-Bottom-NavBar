import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_bottom_nav_bar/app_colors.dart';

class BottonNavItem extends StatelessWidget {
  final String icon;
  final VoidCallback? onPressed;
  final bool selected;

  const BottonNavItem({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: selected
                        ? AppColors.BASE_COLOR.withOpacity(0.16)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    icon,
                    width: 22,
                    colorFilter: ColorFilter.mode(
                      selected ? AppColors.BASE_COLOR : AppColors.BLACK,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                SizedBox(height: 6),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: 4,
                  width: selected ? 18 : 0,
                  decoration: BoxDecoration(
                    color: AppColors.BASE_COLOR,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
