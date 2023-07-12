class TransactionModel {
  int? id;
  String? title;

  TransactionModel({this.id, this.title});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionModel && other.title == title;
  }

  @override
  int get hashCode => title.hashCode;
}
