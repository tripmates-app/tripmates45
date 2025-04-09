class DailyActivitesModel {
  List<Activities>? activities;

  DailyActivitesModel({this.activities});

  DailyActivitesModel.fromJson(Map<String, dynamic> json) {
    if (json['activities'] != null) {
      activities = <Activities>[];
      json['activities'].forEach((v) {
        activities!.add(Activities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (activities != null) {
      data['activities'] = activities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Activities {
  int? activityID;
  String? name;
  String? location;
  double? longitude;
  double? latitude;
  List<String>? images;
  String? description;
  String? totalTime; // corresponds to `total_time`
  int? slots;
  int? totalSlots;
  String? dateTime; // corresponds to `date_time`
  List<dynamic>? participants;
  List<dynamic>? savedBy;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Activities({
    this.activityID,
    this.name,
    this.location,
    this.longitude,
    this.latitude,
    this.images,
    this.description,
    this.totalTime,
    this.slots,
    this.totalSlots,
    this.dateTime,
    this.participants,
    this.savedBy,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  Activities.fromJson(Map<String, dynamic> json) {
    activityID = json['activityID'];
    name = json['name'];
    location = json['location'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    images = json['images'] != null ? List<String>.from(json['images']) : [];
    description = json['description'];
    totalTime = json['total_time'];
    slots = json['slots'];
    totalSlots = json['totalSlots'];
    dateTime = json['date_time'];
    participants = json['participants'] ?? [];
    savedBy = json['saved_by'] ?? [];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['activityID'] = activityID;
    data['name'] = name;
    data['location'] = location;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['images'] = images;
    data['description'] = description;
    data['total_time'] = totalTime;
    data['slots'] = slots;
    data['totalSlots'] = totalSlots;
    data['date_time'] = dateTime;
    data['participants'] = participants;
    data['saved_by'] = savedBy;
    data['userId'] = userId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
