class Player {
  final String name;
  final String position;
  final String team;
  final double price;

  Player({
    required this.name,
    required this.position,
    required this.team,
    required this.price,
  });

  // JSON serialization methods (optional, useful for API calls)
  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['name'] ?? '',
      position: json['position'] ?? '',
      team: json['team'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'position': position,
      'team': team,
      'price': price,
    };
  }

  // Copy with method for easy updates
  Player copyWith({
    String? name,
    String? position,
    String? team,
    double? price,
  }) {
    return Player(
      name: name ?? this.name,
      position: position ?? this.position,
      team: team ?? this.team,
      price: price ?? this.price,
    );
  }
}