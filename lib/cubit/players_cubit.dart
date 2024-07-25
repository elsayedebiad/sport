import 'package:bloc/bloc.dart';
import 'package:login/cubit/players_loading_cubit.dart';

class PlayersLoading extends Cubit<PlayersLoadingState> {
  PlayersLoading() : super(PlayersLoadingInitial());
}
