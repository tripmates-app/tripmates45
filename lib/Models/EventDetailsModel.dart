class EventDetailsModel {
  String? message;
  EventData? data;

  EventDetailsModel({this.message, this.data});

  EventDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? EventData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class EventData {
  int? eventId;
  String? name;
  String? location;
  double? latitude;
  double? longitude;
  String? description;
  String? eventType;
  String? image;
  int? remainingSlots;
  int? totalSlots;
  List<Attendee>? attendees;

  EventData({
    this.eventId,
    this.name,
    this.location,
    this.latitude,
    this.longitude,
    this.description,
    this.eventType,
    this.image,
    this.remainingSlots,
    this.totalSlots,
    this.attendees,
  });

  EventData.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    name = json['name'];
    location = json['location'];
    latitude = double.tryParse(json['latitude'] ?? '0');
    longitude = double.tryParse(json['longitude'] ?? '0');
    description = json['description'];
    eventType = json['event_type'];
    image = json['image'];
    remainingSlots = json['remaining_slots'];
    totalSlots = json['total_slots'];
    if (json['attendees'] != null) {
      attendees = [];
      json['attendees'].forEach((v) {
        attendees!.add(Attendee.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['event_id'] = eventId;
    data['name'] = name;
    data['location'] = location;
    data['latitude'] = latitude.toString();
    data['longitude'] = longitude.toString();
    data['description'] = description;
    data['event_type'] = eventType;
    data['image'] = image;
    data['remaining_slots'] = remainingSlots;
    data['total_slots'] = totalSlots;
    if (attendees != null) {
      data['attendees'] = attendees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attendee {
  int? userId;
  String? name;
  List<String>? images;

  Attendee({this.userId, this.name, this.images});

  Attendee.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    images = json['images'] != null ? List<String>.from(json['images']) : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['user_id'] = userId;
    data['name'] = name;
    data['images'] = images;
    return data;
  }
}
