class CityModel {
  int? id;
  String? title;
  String? region;

  CityModel({this.id, this.title, this.region});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['region'] = region;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CityModel && other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
