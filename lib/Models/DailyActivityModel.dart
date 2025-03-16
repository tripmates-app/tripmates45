class DailyActivitesModel {
  List<Activities>? activities;

  DailyActivitesModel({this.activities});

  DailyActivitesModel.fromJson(Map<String, dynamic> json) {
    if (json['activities'] != null) {
      activities = <Activities>[];
      json['activities'].forEach((v) {
        activities!.add(new Activities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activities != null) {
      data['activities'] = this.activities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Activities {
  int? activityID;
  String? name;
  double? longitude;
  double? latitude;
  List<String>? images;
  String? description;
  int? slots;
  int? totalSlots;
  String? date;
  String? time;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Activities(
      {this.activityID,
        this.name,
        this.longitude,
        this.latitude,
        this.images,
        this.description,
        this.slots,
        this.totalSlots,
        this.date,
        this.time,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Activities.fromJson(Map<String, dynamic> json) {
    activityID = json['activityID'];
    name = json['name'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    images = json['images'].cast<String>();
    description = json['description'];
    slots = json['slots'];
    totalSlots = json['totalSlots'];
    date = json['date'];
    time = json['time'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityID'] = this.activityID;
    data['name'] = this.name;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['images'] = this.images;
    data['description'] = this.description;
    data['slots'] = this.slots;
    data['totalSlots'] = this.totalSlots;
    data['date'] = this.date;
    data['time'] = this.time;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
