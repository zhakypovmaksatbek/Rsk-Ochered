class DepatmentModel {
  int? id;
  String? title;
  String? address;
  int? city;
  int? area;

  DepatmentModel({this.id, this.title, this.address, this.city, this.area});

  DepatmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    address = json['address'];
    city = json['city'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['address'] = address;
    data['city'] = city;
    data['area'] = area;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DepatmentModel &&
        other.id == id &&
        other.title == title &&
        other.city == city;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
