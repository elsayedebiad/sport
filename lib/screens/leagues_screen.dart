import 'package:flutter/material.dart';
import 'package:login/screens/teams_screen.dart';
import '../data/models/get_leagues_model.dart';
import '../data/repository/get_leagues_repo.dart';

class LeaguesScreen extends StatefulWidget {
  final int countryKey;

  // ignore: use_key_in_widget_constructors
  const LeaguesScreen({required this.countryKey});

  @override
  State<LeaguesScreen> createState() => _LeaguesScreenState();
}

class _LeaguesScreenState extends State<LeaguesScreen> {
  late Future<LeagueData> futureLeaguesData;

  @override
  void initState() {
    super.initState();
    futureLeaguesData = LeaguesRepo().fetchLeaguesData(widget.countryKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 23, 23),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFE5E5E5)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color.fromARGB(255, 33, 33, 34),
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 0),
          alignment: Alignment.topLeft,
          child: const Text(
          'Leagues',
          style: TextStyle(color: Color(0xFFE5E5E5), fontWeight: FontWeight.bold),
        ),
        )  ),
      body: FutureBuilder<LeagueData>(
        future: futureLeaguesData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load leagues data'));
          } else if (!snapshot.hasData || snapshot.data!.result.isEmpty) {
            return const Center(child: Text('No leagues available'));
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4.2 / 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(5),
              itemCount: snapshot.data!.result.length,
              itemBuilder: (context, index) {
                var league = snapshot.data!.result[index];
                return GestureDetector(
                  onTap: () {
                    // ignore: unnecessary_null_comparison
                    if (league.leagueKey != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeamsScreen(leagueId: league.leagueKey!),
                        ),
                      );
                    } else {
                      // Handle the case where leagueId is null
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid league ID')),
                      );
                    }
                  },
                  child: Card(
                    color: const Color(0xff1C1C22),
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (league.leagueLogo != null && league.leagueLogo!.isNotEmpty)
                          Image.network(
                            league.leagueLogo!,
                            height: 50,
                            width: 50,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error, color: Color(0xFFE5E5E5));
                            },
                          )
                        else
                          const Icon(Icons.sports_soccer, color: Color(0xFFE5E5E5), size: 50),
                        const SizedBox(height: 10),
                        Text(
                          league.leagueName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFFE5E5E5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
