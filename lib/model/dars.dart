class Dars {
  Dars({
    this.id,
    this.userId,
    this.name,
    this.year,
    this.type,
  });

  Dars.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    year = json['year'];
    type = json['type'];
  }

  int? id;
  int? userId;
  String? name;
  String? year;
  int? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['name'] = name;
    map['year'] = year;
    map['type'] = type;
    return map;
  }
}
