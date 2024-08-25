import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'swich_event.dart';
part 'swich_state.dart';

class SwichBloc extends Bloc<SwichEvent, SwichState> {
  SwichBloc() : super(SwichInitial()) {
    on<SwichCheckEvent>(_onCheking);
    on<SwichStartedEvent>(_onStarted);
    on<SwichRunEvent>(_runProgress);
    on<SwichPauseEvent>(_onPause);
    on<SwichRestartEvent>(_onRestart);
  }
  _onCheking( SwichCheckEvent event,Emitter<SwichState> emit){
    print('Смена состояния');
    emit(SwichCheckState());
  }
  _onStarted(SwichStartedEvent event,Emitter<SwichState> emit) async{
    print('Начало');
    emit(SwichStartedState());
    await Future.delayed(Duration(seconds: 1));
    add(SwichRunEvent(state.duration));
  }
  _runProgress(SwichRunEvent event,Emitter<SwichState> emit) async{
    int i = event.duration;
    if(event.duration !=0){
      i=i-1;
      emit(SwichRunProgressState(i));
      await Future.delayed(Duration(seconds: 1));
      if(state is SwichRunProgressState){
        add(SwichRunEvent(state.duration));
      }
    }
    else{
      emit(SwichDoneProgressState(i));
    }


  }
  _onPause(SwichPauseEvent event ,Emitter<SwichState> emit){
    emit(SwichPauseState(event.duration));
  }
  _onRestart(SwichRestartEvent event,Emitter<SwichState> emit) async {
    emit(SwichRestartState());
    await Future.delayed(Duration(seconds: 1));
    add(SwichRunEvent(60));
  }

}
