class ActivityDetailsModel {
  String? message;
  Data? data;

  ActivityDetailsModel({this.message, this.data});

  ActivityDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? activityId;
  String? name;
  String? location;
  double? latitude;
  double? longitude;
  String? description;
  String? dateTime;
  String? totalTime;
  Null? eventType;
  List<String>? image;
  int? remainingSlots;
  int? totalSlots;
  List<Attendees>? attendees;

  Data(
      {this.activityId,
        this.name,
        this.location,
        this.latitude,
        this.longitude,
        this.description,
        this.dateTime,
        this.totalTime,
        this.eventType,
        this.image,
        this.remainingSlots,
        this.totalSlots,
        this.attendees});

  Data.fromJson(Map<String, dynamic> json) {
    activityId = json['activity_id'];
    name = json['name'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    description = json['description'];
    dateTime = json['date_time'];
    totalTime = json['total_time'];
    eventType = json['event_type'];
    image = json['image'].cast<String>();
    remainingSlots = json['remaining_slots'];
    totalSlots = json['total_slots'];
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
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['description'] = this.description;
    data['date_time'] = this.dateTime;
    data['total_time'] = this.totalTime;
    data['event_type'] = this.eventType;
    data['image'] = this.image;
    data['remaining_slots'] = this.remainingSlots;
    data['total_slots'] = this.totalSlots;
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
  int? guests;

  Attendees({this.userId, this.name, this.images, this.guests});

  Attendees.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    images = json['images'].cast<String>();
    guests = json['guests'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['images'] = this.images;
    data['guests'] = this.guests;
    return data;
  }
}
