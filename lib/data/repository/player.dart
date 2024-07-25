// ignore_for_file: use_rethrow_when_possible, avoid_print

import 'package:dio/dio.dart';
import 'package:login/data/models/player_mpdel.dart';

class PlayersRepository {
  final Dio dio;
  final String apiKey = 'f06896886f1b1c3e4f649c2a759041a0016c2e1fc6de384e8213c84b4c4f8de8';

  PlayersRepository(this.dio);

  Future<List<Player>> getPlayers(int teamId) async {
    final url = 'https://apiv2.allsportsapi.com/football/?met=Players&APIkey=$apiKey&teamId=$teamId';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data['result'] as List;
        return data.map((json) => Player.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load players');
      }
    } catch (e) {
      print('Error fetching players: $e');
      throw e;
    }
  }

  Future<List<Player>> searchPlayers(int teamId, String playerName) async {
    // تأكد من ترميز الاسم بشكل صحيح في الـ URL
    final encodedName = Uri.encodeComponent(playerName);
    final url = 'https://apiv2.allsportsapi.com/football/?met=Players&APIkey=$apiKey&teamId=$teamId&playerName=$encodedName';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data['result'] as List;
        return data.map((json) => Player.fromJson(json)).toList();
      } else {
        throw Exception('Failed to search players');
      }
    } catch (e) {
      print('Error searching players: $e');
      throw e;
    }
  }
}