import 'package:bloc/bloc.dart';
import 'package:login/data/models/player_mpdel.dart';
import 'package:login/data/repository/player.dart';
import 'package:meta/meta.dart';

part 'players_loading_state.dart';

class PlayersLoadingCubit extends Cubit<PlayersLoadingState> {
  PlayersLoadingCubit() : super(PlayersLoadingInitial());
}
