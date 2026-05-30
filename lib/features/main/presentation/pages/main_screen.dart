import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bottom_nav_bar/features/main/presentation/manager/main/main_bloc.dart';
import 'package:my_bottom_nav_bar/features/main/presentation/manager/main/main_state.dart';
import 'package:my_bottom_nav_bar/features/main/presentation/widgets/tabs/calendar_tab.dart';
import 'package:my_bottom_nav_bar/features/main/presentation/widgets/tabs/home_tab.dart';
import 'package:my_bottom_nav_bar/features/main/presentation/widgets/tabs/messages_tab.dart';
import 'package:my_bottom_nav_bar/features/main/presentation/widgets/tabs/profile_tab.dart';
import 'package:my_bottom_nav_bar/features/main/presentation/widgets/my_bottom_nav/my_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const tabs = [HomeTab(), MessagesTab(), CalendarTab(), ProfileTab()];

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: const Text('Modern Bottom NavBar'),
            centerTitle: true,
          ),
          body: IndexedStack(index: state.currentIndex, children: tabs),
          bottomNavigationBar: const MyBottomNavigationBar(),
        );
      },
    );
  }
}
