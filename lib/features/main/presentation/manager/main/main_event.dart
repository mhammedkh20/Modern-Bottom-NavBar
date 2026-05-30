abstract class MainEvent {
  const MainEvent();
}

class ChangeTabEvent extends MainEvent {
  final int index;

  const ChangeTabEvent(this.index);
}
