part of 'swich_bloc.dart';

@immutable
sealed class SwichEvent {}

final class  SwichCheckEvent extends SwichEvent{
  SwichCheckEvent();
}
final class  SwichStartedEvent extends SwichEvent{
  SwichStartedEvent();
}
final class SwichRunEvent extends SwichEvent{
  int duration;
  SwichRunEvent(this.duration);
}
final class  SwichPauseEvent extends SwichEvent{
  int duration;
  SwichPauseEvent(this.duration);
}
final class  SwichRestartEvent extends SwichEvent{
  int duration;
  SwichRestartEvent(this.duration);
}