import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:my_bottom_nav_bar/app_colors.dart';
import 'package:my_bottom_nav_bar/features/main/presentation/manager/main/main_bloc.dart';
import 'package:my_bottom_nav_bar/features/main/presentation/manager/main/main_event.dart';
import 'package:my_bottom_nav_bar/features/main/presentation/manager/main/main_state.dart';
import 'package:my_bottom_nav_bar/features/main/presentation/widgets/my_bottom_nav/add_event_button.dart';
import 'package:my_bottom_nav_bar/features/main/presentation/widgets/my_bottom_nav/button_nav_item.dart';
import 'package:my_bottom_nav_bar/features/main/presentation/widgets/my_bottom_nav/interactive_glow_surface.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              final indexSelected = context.read<MainBloc>().index;
              final glassSettings = LiquidGlassSettings(
                blur: 8,
                thickness: 18,
                glassColor: const Color.fromARGB(122, 255, 255, 255),
                lightIntensity: 0.7,
                ambientStrength: 0.12,
                saturation: 1.2,
              );
              return Row(
                children: [
                  Expanded(
                    child: PhysicalModel(
                      color: Colors.transparent,
                      shadowColor: AppColors.BLACK.withOpacity(0.28),
                      elevation: 12,
                      borderRadius: BorderRadius.circular(32),
                      clipBehavior: Clip.none,
                      child: LiquidGlassLayer(
                        settings: glassSettings,
                        child: LiquidStretch(
                          stretch: 0.5,
                          interactionScale: 1.02,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: SizedBox(
                              height: 80,
                              child: Center(
                                child: LiquidStretch(
                                  stretch: 0.45,
                                  interactionScale: 1.03,
                                  child: InteractiveGlowSurface(
                                    borderRadius: BorderRadius.circular(28),
                                    glowColor: AppColors.BASE_COLOR,
                                    maxOpacity: 0.18,
                                    child: LiquidGlass(
                                      shape: const LiquidRoundedSuperellipse(
                                        borderRadius: 28,
                                      ),
                                      child: Container(
                                        height: 65,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        child: Row(
                                          children: [
                                            BottonNavItem(
                                              icon:
                                                  'assets/images/main/ic_home_unselected.svg',
                                              onPressed: () {
                                                context.read<MainBloc>().add(
                                                  ChangeTabEvent(0),
                                                );
                                              },
                                              selected: indexSelected == 0,
                                            ),
                                            BottonNavItem(
                                              icon:
                                                  'assets/images/main/ic_messages_unselected.svg',
                                              onPressed: () {
                                                context.read<MainBloc>().add(
                                                  ChangeTabEvent(1),
                                                );
                                              },
                                              selected: indexSelected == 1,
                                            ),
                                            BottonNavItem(
                                              icon:
                                                  'assets/images/main/ic_calendar_unselected.svg',
                                              onPressed: () {
                                                context.read<MainBloc>().add(
                                                  ChangeTabEvent(2),
                                                );
                                              },
                                              selected: indexSelected == 2,
                                            ),
                                            BottonNavItem(
                                              icon:
                                                  "assets/images/main/ic_profile.svg",
                                              onPressed: () {
                                                context.read<MainBloc>().add(
                                                  ChangeTabEvent(3),
                                                );
                                              },
                                              selected: indexSelected == 3,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  PhysicalModel(
                    color: Colors.transparent,
                    shadowColor: AppColors.BLACK.withOpacity(0.28),
                    elevation: 12,
                    borderRadius: BorderRadius.circular(30),
                    clipBehavior: Clip.none,
                    child: LiquidGlassLayer(
                      settings: glassSettings,
                      child: AddEventButton(size: 60),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
