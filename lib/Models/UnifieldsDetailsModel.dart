import 'ActivityDetailsScreen.dart';
import 'EventDetailsModel.dart';

class UnifiedEventModel {
  int? id;
  String? name;
  String? location;
  double? latitude;
  double? longitude;
  String? description;
  String? dateTime; // Only for Activity
  String? totalTime; // Only for Activity
  String? eventType;
  List<String>? images; // List of images from both
  int? remainingSlots;
  int? totalSlots;
  List<UnifiedAttendee>? attendees;
  UnifiedBusinessProfile? businessProfile; // Only for Event

  UnifiedEventModel({
    this.id,
    this.name,
    this.location,
    this.latitude,
    this.longitude,
    this.description,
    this.dateTime,
    this.totalTime,
    this.eventType,
    this.images,
    this.remainingSlots,
    this.totalSlots,
    this.attendees,
    this.businessProfile,
  });

  /// Convert ActivityDetailsModel into UnifiedEventModel
  factory UnifiedEventModel.fromActivity(ActivityDetailsModel model) {
    return UnifiedEventModel(
      id: model.data?.activityId,
      name: model.data?.name,
      location: model.data?.location,
      latitude: model.data?.latitude,
      longitude: model.data?.longitude,
      description: model.data?.description,
      dateTime: model.data?.dateTime,
      totalTime: model.data?.totalTime,
      eventType: model.data?.eventType?.toString(),
      images: model.data?.image ?? [],
      remainingSlots: model.data?.remainingSlots,
      totalSlots: model.data?.totalSlots,
      attendees: model.data?.attendees?.map((e) => UnifiedAttendee.fromActivity(e)).toList(),
      businessProfile: null, // No business profile in Activity
    );
  }

  /// Convert EventDetailsModel into UnifiedEventModel
  factory UnifiedEventModel.fromEvent(EventDetailsModel model) {
    return UnifiedEventModel(
      id: model.data?.eventId,
      name: model.data?.name,
      location: model.data?.location,
      latitude: model.data?.latitude,
      longitude: model.data?.longitude,
      description: model.data?.description,
      eventType: model.data?.eventType,
      images: model.data?.image != null ? [model.data!.image!] : [],
      remainingSlots: model.data?.remainingSlots,
      totalSlots: model.data?.totalSlots,
      attendees: model.data?.attendees?.map((e) => UnifiedAttendee.fromEvent(e)).toList(),
      businessProfile: model.data?.businessProfile != null
          ? UnifiedBusinessProfile.fromEvent(model.data!.businessProfile!)
          : null,
    );
  }
}

class UnifiedAttendee {
  int? userId;
  String? name;
  List<String>? images;
  int? guests;

  UnifiedAttendee({this.userId, this.name, this.images, this.guests});

  /// Convert from ActivityDetailsModel attendee
  factory UnifiedAttendee.fromActivity(Attendees attendee) {
    return UnifiedAttendee(
      userId: attendee.userId,
      name: attendee.name,
      images: attendee.images,
      guests: attendee.guests,
    );
  }

  /// Convert from EventDetailsModel attendee
  factory UnifiedAttendee.fromEvent(Attendee attendee) {
    return UnifiedAttendee(
      userId: attendee.userId,
      name: attendee.name,
      images: attendee.images,
      guests: null,
    );
  }
}

class UnifiedBusinessProfile {
  int? id;
  String? name;
  String? logo;
  String? description;
  int? totalEventsCreated;
  int? totalFollowers;
  bool? isFollowedByCurrentUser;

  UnifiedBusinessProfile({
    this.id,
    this.name,
    this.logo,
    this.description,
    this.totalEventsCreated,
    this.totalFollowers,
    this.isFollowedByCurrentUser
  });

  factory UnifiedBusinessProfile.fromEvent(BusinessProfile profile) {
    return UnifiedBusinessProfile(
      id: profile.id,
      name: profile.name,
      logo: profile.logo,
      description: profile.description,
      totalEventsCreated: profile.totalEventsCreated,
      totalFollowers: profile.totalFollowers,
      isFollowedByCurrentUser: profile.isFollowedByCurrentUser
    );
  }
}
