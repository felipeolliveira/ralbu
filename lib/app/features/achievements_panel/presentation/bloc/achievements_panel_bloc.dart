import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'achievements_panel_event.dart';
part 'achievements_panel_state.dart';

class AchievementsPanelBloc extends Bloc<AchievementsPanelEvent, AchievementsPanelState> {
  AchievementsPanelBloc() : super(AchievementsPanelInitial()) {
    on<AchievementsPanelEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
