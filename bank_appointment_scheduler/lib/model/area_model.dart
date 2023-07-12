class AreaModel {
  int? id;
  String? title;
  int? city;

  AreaModel({this.id, this.title, this.city});

  AreaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['city'] = city;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AreaModel &&
        other.id == id &&
        other.title == title &&
        other.city == city;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
