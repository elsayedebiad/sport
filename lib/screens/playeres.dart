// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/cubit/players_loading_cubit.dart';
import 'package:login/data/repository/player.dart';
import 'package:share_plus/share_plus.dart';

class PlayersScreen extends StatelessWidget {
  final String teamId;

  const PlayersScreen({required this.teamId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayersCubit(PlayersRepository(Dio()), teamId)..fetchPlayers(),
      child: Scaffold(
        backgroundColor: Color(0xff191F1A),
        appBar: AppBar(
          backgroundColor: Color(0xff191F1A),
          centerTitle: false,
          title: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Pla',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextSpan(
                  text: 'yers',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.pink,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     style: TextStyle(color: Colors.white),
            //     decoration: const InputDecoration(
            //       hintText: 'Search Player',
            //       hintStyle: TextStyle(color: Colors.white70),
            //       border: OutlineInputBorder(
            //         borderSide: BorderSide(color: Color.fromARGB(255, 87, 90, 87)),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: Color.fromARGB(255, 45, 46, 45)),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: Colors.green),
            //       ),
            //     ),
            //     onChanged: (query) {
            //       context.read<PlayersCubit>().searchPlayers(query);
            //     },
            //   ),
            // ),
            Expanded(
              child: BlocBuilder<PlayersCubit, PlayersState>(
                builder: (context, state) {
                  if (state is PlayersLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PlayersLoaded) {
                    return ListView.builder(
                      itemCount: state.players.length,
                      itemBuilder: (context, index) {
                        final player = state.players[index];
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              player.imageUrl,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.person, size: 40, color: Colors.white);
                              },
                              loadingBuilder: (context, child, progress) {
                                if (progress == null) {
                                  return child;
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              },
                            ),
                          ),
                          title: Text(player.name, style: TextStyle(color: Colors.white)),
                          subtitle: Text(player.type, style: TextStyle(color: Colors.pink)),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: Color(0xff1A1A1A),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: Colors.pink, width: 2),
                                ),
                                title: Text(player.name, style: TextStyle(color: Colors.white)),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        player.imageUrl,
                                        errorBuilder: (context, error, stackTrace) {
                                          return const Icon(Icons.person, size: 100, color: Colors.white);
                                        },
                                        loadingBuilder: (context, child, progress) {
                                          if (progress == null) {
                                            return child;
                                          } else {
                                            return const CircularProgressIndicator();
                                          }
                                        },
                                      ),
                                    ),
                                    Text('Number: ${player.number}', style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,),),
                                    Text('Country: ${player.country}', style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic)),
                                    Text('Type: ${player.type}', style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic)),
                                    Text('Age: ${player.age}', style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic)),
                                    Text('Yellow Cards: ${player.yellowCards}', style: TextStyle(color: Colors.white)),
                                    Text('Red Cards: ${player.redCards}', style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic)),
                                    Text('Goals: ${player.goals}', style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic)),
                                    Text('Assists: ${player.assists}', style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic)),
                                    SizedBox(height: 16),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.pink,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          side: BorderSide(color: Colors.black),
                                        ),
                                        textStyle: TextStyle(
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      onPressed: () {
                                        Share.share('The player: ${player.name} from ${player.country}!');
                                      },
                                      child: Text('Share Player'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else if (state is PlayersError) {
                    return Center(child: Text('Failed to load players: ${state.message}', style: TextStyle(color: Colors.white)));
                  } else {
                    return const Center(child: Text('No data available', style: TextStyle(color: Colors.white)));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}