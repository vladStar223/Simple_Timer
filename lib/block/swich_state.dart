part of 'swich_bloc.dart';

@immutable
sealed class SwichState {
  late String nameState;
  late int duration = 60;
}

final class SwichInitial extends SwichState {
  @override
  String get nameState => 'Initial';
}
final class SwichCheckState extends SwichState {
  @override
  String get nameState => 'Check';
}
final class SwichStartedState extends SwichState {
  @override
  String get nameState => 'Started';
}
final class SwichRunProgressState extends SwichState{
  @override
  var duration;

  SwichRunProgressState(this.duration);
  @override
  String get nameState => 'Work';
}
final class SwichDoneProgressState extends SwichState{
  @override
  var duration;
  SwichDoneProgressState(this.duration);
  @override
  String get nameState => 'Done';
}
final class SwichRunningProgressState extends SwichState{
  @override
  var duration;

  SwichRunningProgressState(this.duration);
  @override
  String get nameState => 'Work';
}
final class SwichPauseState extends SwichState{
  @override
  var duration;
  SwichPauseState(this.duration);
  @override
  String get nameState => 'Pause';
}
final class SwichRestartState extends SwichState {
  @override
  String get nameState => 'Restart';
}