import 'ActivityDetailsScreen.dart';
import 'EventDetailsModel.dart';

class UnifiedEventModel {
  int? id;
  String? name;
  String? location;
  double? latitude;
  double? longitude;
  String? description;
  String? dateTime; // Only available in ActivityDetailsModel
  String? totalTime; // Only available in ActivityDetailsModel
  String? eventType;
  List<String>? images; // Handles both List<String> and single String
  int? remainingSlots;
  int? totalSlots;
  List<UnifiedAttendee>? attendees;

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
    );
  }
}

class UnifiedAttendee {
  int? userId;
  String? name;
  List<String>? images;
  int? guests;

  UnifiedAttendee({this.userId, this.name, this.images, this.guests});

  /// Convert Attendees from ActivityDetailsModel
  factory UnifiedAttendee.fromActivity(Attendees attendee) {
    return UnifiedAttendee(
      userId: attendee.userId,
      name: attendee.name,
      images: attendee.images,
      guests: attendee.guests, // Only in ActivityDetailsModel
    );
  }

  /// Convert Attendee from EventDetailsModel
  factory UnifiedAttendee.fromEvent(Attendee attendee) {
    return UnifiedAttendee(
      userId: attendee.userId,
      name: attendee.name,
      images: attendee.images,
      guests: null, // Not available in EventDetailsModel
    );
  }
}
