class MyActivityModel {
  String? message;
  List<Activities>? activities;

  MyActivityModel({this.message, this.activities});

  MyActivityModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['activities'] != null) {
      activities = (json['activities'] as List)
          .map((v) => Activities.fromJson(v))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'activities': activities?.map((v) => v.toJson()).toList(),
    };
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
  String? totalTime;
  int? slots;
  int? totalSlots;
  String? dateTime;
  List<dynamic>? participants; // Fixed: Replaced List<Null> with List<dynamic>
  List<int>? savedBy;
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
    activityID = json['activityID'] as int?;
    name = json['name'] as String?;
    location = json['location'] as String?;
    longitude = (json['longitude'] ?? 0.0) as double?; // Ensure non-null
    latitude = (json['latitude'] ?? 0.0) as double?;
    images = (json['images'] as List<dynamic>?)?.cast<String>() ?? [];
    description = json['description'] as String?;
    totalTime = json['total_time'] as String?;
    slots = json['slots'] as int?;
    totalSlots = json['totalSlots'] as int?;
    dateTime = json['date_time'] as String?;
    participants = json['participants'] as List<dynamic>? ?? []; // Fixed: Removed `Null`
    savedBy = (json['saved_by'] as List<dynamic>?)?.cast<int>() ?? []; // Fixed: Prevent null errors
    userId = json['userId'] as int?;
    createdAt = json['createdAt'] as String?;
    updatedAt = json['updatedAt'] as String?;
  }

  Map<String, dynamic> toJson() {
    return {
      'activityID': activityID,
      'name': name,
      'location': location,
      'longitude': longitude,
      'latitude': latitude,
      'images': images,
      'description': description,
      'total_time': totalTime,
      'slots': slots,
      'totalSlots': totalSlots,
      'date_time': dateTime,
      'participants': participants, // Fixed: No need to map over `Null`
      'saved_by': savedBy,
      'userId': userId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
