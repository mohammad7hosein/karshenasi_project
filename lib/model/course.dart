class Course {
  Course({
    this.id,
    this.userId,
    this.darsId,
    this.day1,
    this.time1,
    this.day2Type,
    this.day2,
    this.time2,
    this.name,
  });

  Course.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    darsId = json['dars_id'];
    name = json['dars_name'];
    day1 = json['day1'];
    time1 = json['time1'];
    day2Type = json['day2_type'];
    day2 = json['day2'];
    time2 = json['time2'];
  }

  int? id;
  int? userId;
  int? darsId;
  String? name;
  String? day1;
  String? time1;
  String? day2Type;
  String? day2;
  String? time2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['dars_id'] = darsId;
    map['dars_name'] = name;
    map['day1'] = day1;
    map['time1'] = time1;
    map['day2_type'] = day2Type;
    map['day2'] = day2;
    map['time2'] = time2;
    return map;
  }
}
