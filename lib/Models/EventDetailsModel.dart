class EventDetailsModel {
  String? message;
  EventData? data;

  EventDetailsModel({this.message, this.data});

  factory EventDetailsModel.fromJson(Map<String, dynamic> json) {
    return EventDetailsModel(
      message: json['message'],
      data: json['data'] != null ? EventData.fromJson(json['data']) : null,
    );
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
  BusinessProfile? businessProfile;

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
    this.businessProfile,
  });

  factory EventData.fromJson(Map<String, dynamic> json) {
    return EventData(
      eventId: json['event_id'],
      name: json['name'],
      location: json['location'],
      latitude: double.tryParse(json['latitude'].toString()),
      longitude: double.tryParse(json['longitude'].toString()),
      description: json['description'],
      eventType: json['event_type'],
      image: json['image'],
      remainingSlots: json['remaining_slots'],
      totalSlots: json['total_slots'],
      attendees: (json['attendees'] as List<dynamic>?)
          ?.map((e) => Attendee.fromJson(e))
          .toList(),
      businessProfile: json['business_profile'] != null
          ? BusinessProfile.fromJson(json['business_profile'])
          : null,
    );
  }
}

class Attendee {
  int? userId;
  String? name;
  List<String>? images;

  Attendee({this.userId, this.name, this.images});

  factory Attendee.fromJson(Map<String, dynamic> json) {
    return Attendee(
      userId: json['user_id'],
      name: json['name'],
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
    );
  }
}

class BusinessProfile {
  int? id;
  String? name;
  String? logo;
  String? description;
  int? totalEventsCreated;
  int? totalFollowers;
  bool? isFollowedByCurrentUser;

  BusinessProfile({
    this.id,
    this.name,
    this.logo,
    this.description,
    this.totalEventsCreated,
    this.totalFollowers,
    this.isFollowedByCurrentUser,
  });

  factory BusinessProfile.fromJson(Map<String, dynamic> json) {
    return BusinessProfile(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      description: json['description'],
      totalEventsCreated: json['total_events_created'],
      totalFollowers: json['total_followers'],
      isFollowedByCurrentUser: json['is_followed_by_current_user'],
    );
  }
}
