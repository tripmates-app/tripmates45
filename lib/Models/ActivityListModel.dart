class ActivityListModel {
  String? message;
  List<Data>? data;

  ActivityListModel({this.message, this.data});

  ActivityListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null
        ? List<Data>.from(json['data'].map((v) => Data.fromJson(v)))
        : [];
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data?.map((v) => v.toJson()).toList(),
    };
  }
}

class Data {
  int? eventId;
  int? activityId;
  String? name;
  String? location;
  double? latitude;
  double? longitude;
  String? dateTime;
  String? description;
  String? eventType;
  List<String> image = [];
  int? remainingSlots;
  int? totalSlots;
  List<Attendees> attendees = [];
  bool? userJoined;
  List<String> creatorImage = [];

  Data({
    this.eventId,
    this.activityId,
    this.name,
    this.location,
    this.latitude,
    this.longitude,
    this.dateTime,
    this.description,
    this.eventType,
    this.image = const [],
    this.remainingSlots,
    this.totalSlots,
    this.attendees = const [],
    this.userJoined,
    this.creatorImage = const [],
  });

  Data.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    activityId = json['activity_id'];
    name = json['name'];
    location = json['location'];
    latitude = json['latitude']?.toDouble();
    longitude = json['longitude']?.toDouble();
    dateTime = json['date_time'];
    description = json['description'];
    eventType = json.containsKey('event_type') ? json['event_type'] : null;

    image = json['image'] != null && json['image'] is List
        ? List<String>.from(json['image'])
        : [];

    remainingSlots = json['remaining_slots'];
    totalSlots = json['total_slots'];

    attendees = json['attendees'] != null && json['attendees'] is List
        ? json['attendees']
        .where((v) => v != null) // Remove null attendees
        .map<Attendees>((v) => Attendees.fromJson(v))
        .toList()
        : [];

    userJoined = json['user_joined'] ?? false;

    creatorImage = json['creator_image'] != null && json['creator_image'] is List
        ? List<String>.from(json['creator_image'])
        : [];
  }

  Map<String, dynamic> toJson() {
    return {
      'event_id': eventId,
      'activity_id': activityId,
      'name': name,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'date_time': dateTime,
      'description': description,
      if (eventType != null) 'event_type': eventType, // Include only if not null
      'image': image,
      'remaining_slots': remainingSlots,
      'total_slots': totalSlots,
      'attendees': attendees.map((v) => v.toJson()).toList(),
      'user_joined': userJoined,
      'creator_image': creatorImage,
    };
  }
}

class Attendees {
  int? userId;
  String? name;
  List<String> images = [];

  Attendees({this.userId, this.name, this.images = const []});

  Attendees.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    images = json['images'] != null && json['images'] is List
        ? List<String>.from(json['images'])
        : [];
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'name': name,
      'images': images,
    };
  }
}
