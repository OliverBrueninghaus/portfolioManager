class PlayerData {
  final String name;
  final int townHallLevel;
  final int trophies;

  PlayerData({this.name, this.townHallLevel, this.trophies});

  factory PlayerData.fromJson(Map<String, dynamic> json) {
    return PlayerData(
      name: json['name'],
      townHallLevel: json['townHallLevel'],
      trophies: json['trophies'],
    );
  }
}
