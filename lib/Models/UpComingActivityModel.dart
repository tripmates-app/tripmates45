class UpComingActivitiesModel {
  List<Activities>? activities;

  UpComingActivitiesModel({this.activities});

  UpComingActivitiesModel.fromJson(Map<String, dynamic> json) {
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
  String? dateTime;
  List<int>? participants;
  List<String>? images;
  String? location;
  String? description;
  String? totalTime;
  int? slots;
  int? totalSlots;
  List<int>? savedBy;
  bool? joined;

  Activities(
      {this.activityID,
        this.name,
        this.dateTime,
        this.participants,
        this.images,
        this.location,
        this.description,
        this.totalTime,
        this.slots,
        this.totalSlots,
        this.savedBy,
        this.joined});

  Activities.fromJson(Map<String, dynamic> json) {
    activityID = json['activityID'];
    name = json['name'];
    dateTime = json['date_time'];
    participants = json['participants'].cast<int>();
    images = json['images'].cast<String>();
    location = json['location'];
    description = json['description'];
    totalTime = json['total_time'];
    slots = json['slots'];
    totalSlots = json['totalSlots'];
    savedBy = json['saved_by'].cast<int>();
    joined = json['joined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityID'] = this.activityID;
    data['name'] = this.name;
    data['date_time'] = this.dateTime;
    data['participants'] = this.participants;
    data['images'] = this.images;
    data['location'] = this.location;
    data['description'] = this.description;
    data['total_time'] = this.totalTime;
    data['slots'] = this.slots;
    data['totalSlots'] = this.totalSlots;
    data['saved_by'] = this.savedBy;
    data['joined'] = this.joined;
    return data;
  }
}
