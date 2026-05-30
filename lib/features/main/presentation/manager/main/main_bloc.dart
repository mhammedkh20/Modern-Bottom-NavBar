import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bottom_nav_bar/features/main/presentation/manager/main/main_event.dart';
import 'package:my_bottom_nav_bar/features/main/presentation/manager/main/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState.initial()) {
    on<ChangeTabEvent>(_onChangeTab);
  }

  int get index => state.currentIndex;

  void _onChangeTab(ChangeTabEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }
}
