class Player {
  final int id;
  final String name;
  final String number;
  final String country;
  final String imageUrl;
  final String type;
  final String age;
  final String yellowCards;
  final String redCards;
  final String goals;
  final String assists;

  Player({
    required this.id,
    required this.name,
    required this.number,
    required this.country,
    required this.imageUrl,
    required this.type,
    required this.age,
    required this.yellowCards,
    required this.redCards,
    required this.goals,
    required this.assists,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['player_key'] ?? 0,
      name: json['player_name'] ?? '',
      number: json['player_number'] ?? '',
      country: json['player_country'] ?? '',
      imageUrl: json['player_image'] ?? '',
      type: json['player_type'] ?? '',
      age: json['player_age'] ?? '',
      yellowCards: json['player_yellow_cards'] ?? '',
      redCards: json['player_red_cards'] ?? '',
      goals: json['player_goals'] ?? '',
      assists: json['player_assists'] ?? '',
    );
  }
}