class JoinedActivitesModel {
  bool? success;
  String? message;
  List<Activities>? activities;

  JoinedActivitesModel({this.success, this.message, this.activities});

  JoinedActivitesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['activities'] != null) {
      activities = <Activities>[];
      json['activities'].forEach((v) {
        activities!.add(new Activities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.activities != null) {
      data['activities'] = this.activities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Activities {
  int? activityId;
  String? name;
  String? location;
  String? description;
  String? dateTime;
  int? remainingSlots;
  int? slot;
  List<String>? image;
  List<Attendees>? attendees;

  Activities(
      {this.activityId,
        this.name,
        this.location,
        this.description,
        this.dateTime,
        this.remainingSlots,
        this.slot,
        this.image,
        this.attendees});

  Activities.fromJson(Map<String, dynamic> json) {
    activityId = json['activity_id'];
    name = json['name'];
    location = json['location'];
    description = json['description'];
    dateTime = json['date_time'];
    remainingSlots = json['remaining_slots'];
    slot = json['slot'];
    image = json['image'].cast<String>();
    if (json['attendees'] != null) {
      attendees = <Attendees>[];
      json['attendees'].forEach((v) {
        attendees!.add(new Attendees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity_id'] = this.activityId;
    data['name'] = this.name;
    data['location'] = this.location;
    data['description'] = this.description;
    data['date_time'] = this.dateTime;
    data['remaining_slots'] = this.remainingSlots;
    data['slot'] = this.slot;
    data['image'] = this.image;
    if (this.attendees != null) {
      data['attendees'] = this.attendees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attendees {
  int? userId;
  String? name;
  List<String>? images;

  Attendees({this.userId, this.name, this.images});

  Attendees.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['images'] = this.images;
    return data;
  }
}
