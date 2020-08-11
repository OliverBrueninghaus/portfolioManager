class ClanInfoData {
  final String name;
  final String description;
  final String locationName;

  ClanInfoData({this.name, this.description, this.locationName});

  factory ClanInfoData.fromJson(Map<String, dynamic> json) {
    return ClanInfoData(
      name: json['name'],
      description: json['description'],
      locationName: json['location.name'],
    );
  }
}
