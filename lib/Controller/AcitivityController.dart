


import 'dart:io';

import 'package:geocode/geocode.dart';
import 'package:get/get.dart';
import 'package:tripmates/Constants/listdata.dart';
import 'package:tripmates/Models/ActivityDetailsScreen.dart';
import 'package:tripmates/Models/ActivityListModel.dart';
import 'package:tripmates/Models/DailyActivityModel.dart';
import 'package:tripmates/Models/EventDetailsModel.dart';
import 'package:tripmates/Models/MatesModel.dart';
import 'package:tripmates/Models/MyActivityModel.dart';
import 'package:tripmates/Models/NearbyMates.dart';
import 'package:tripmates/Models/ProfileModel.dart';
import 'package:tripmates/Models/SavedActivitesModel.dart';
import 'package:tripmates/Repository/ActivityRepository.dart';
import 'package:tripmates/Repository/MatesRepository.dart';
import 'package:tripmates/Repository/ProfileRespository.dart';

import '../Models/UnifieldsDetailsModel.dart';

class Acitivitycontroller extends GetxController {

  var location = "".obs;
  ActivityListModel? activityListModel;
  MyActivityModel?myActivityModel;
  DailyActivitesModel? dailyActivites;
  ActivityDetailsModel?activityDetailsModel;
  EventDetailsModel?eventDetailsModel;
  SavedEventsResponse?savedEventsResponse;
  var counter = 1.obs; // Initialize the counter inside StatefulBuilder

  void incrementCounter() {
    counter.value++;
  }

  void decrementCounter() {
    if (counter > 1) {
      counter.value--;
    }
  }

  UnifiedEventModel? eventModel; //..............handle both event and activity details

  void loadData(dynamic json) {
    if (json.containsKey('data') && json['data'].containsKey('event_id')) {
      eventModel = UnifiedEventModel.fromEvent(EventDetailsModel.fromJson(json));
    } else {
      eventModel = UnifiedEventModel.fromActivity(ActivityDetailsModel.fromJson(json));
    }
  }




//................................ Daily Activities...................
  Future<bool> DailyActivities() async {
    final activity = await Activityrepository().GetDailyActivites();
    print("Profile Fatch is : $activity");
    if (activity == null) {
      return false;
    } else {
      dailyActivites = DailyActivitesModel.fromJson(activity);
      update(["Activity_update"]);
      return true;
    }
  }

//..............................Get Acticity List ..................

  Future<bool> ActivitieList() async {
    final activity = await Activityrepository().ActivityList();
    print("Profile Fatch is : $activity");
    if (activity == null) {
      return false;
    } else {
      activityListModel = ActivityListModel.fromJson(activity);
      update(["Activity_update"]);
      return true;
    }
  }


//..............................Get Acticity List ..................

  Future<bool> CreateActivity(File image,
      String name,
      String longitude,
      String Latitude,
      String description,
      String totalslots,
      String time,
      String date,
      String Location,
      String totaltime,) async {
    final activity = await Activityrepository().CreateActivity(image: image,
        name: name,
        longitude: longitude,
        Latitude: Latitude,
        description: description,
        totalslots: totalslots,
        time: time,
        date: date,
        Location: Location,
        totaltime: totaltime);
    print("Profile Fatch is : $activity");
    if (activity == null) {
      return false;
    } else {
      dailyActivites = DailyActivitesModel.fromJson(activity);
      update(["Activity_update"]);
      return true;
    }
  }


  //..............................Update Acticity  ..................

  Future<bool> UpdateActivity(
       String activityId, // ID of the activity to update
       File? image, // Image is optional
       String name,
       String longitude,
       String latitude,
       String description,
       String totalslots,
       String time,
       String date,
       String location,
       String totaltime,
      ) async {
    final activity = await Activityrepository().PutActivity(activityId: activityId, name: name, longitude: longitude, latitude: latitude, description: description, totalslots: totalslots, time: time, date: date, location: location, totaltime: totaltime);
    print("Profile Fatch is : $activity");
    if (activity == null) {
      return false;
    } else {
      dailyActivites = DailyActivitesModel.fromJson(activity);
      update(["Activity_update"]);
      return true;
    }
  }




//...................................... get the Location in Langitude and latitude ..........

  Future<Map<String, double>> getCoordinatesFromGeoCode(String addressInput) async {
    try {
      GeoCode geoCode = GeoCode();

      // Forward geocoding to get coordinates
      Coordinates? coordinates = await geoCode.forwardGeocoding(address: addressInput);

      // Ensure latitude and longitude are not null
      double latitude = coordinates.latitude ?? 37.7749;  // Default: San Francisco, CA
      double longitude = coordinates.longitude ?? -122.4194; // Default: San Francisco, CA

      return {
        'latitude': latitude,
        'longitude': longitude,
      };
    } catch (e) {
      print('Error in getCoordinatesFromGeoCode: $e');

      // Return default fallback coordinates in case of error
      return {
        'latitude': 37.7749,  // Default to San Francisco, CA
        'longitude': -122.4194,
      };
    }
  }


//..............................Get Acticity Details ..................

  Future<bool> ActivitieDetails(String id) async {
    final activity = await Activityrepository().ActivityDetails(id);
    print("Profile Fatch is : $activity");
    if (activity == null) {
      return false;
    } else {
      activityDetailsModel = ActivityDetailsModel.fromJson(activity);
      loadData(activity);
      update(["Activity_update"]);
      return true;
    }
  }

//..............................Get Event Details ..................

  Future<bool> EventDetails(String id) async {
    final activity = await Activityrepository().EventDetails(id);
    print("Profile Fatch is : $activity");
    if (activity == null) {
      return false;
    } else {
      eventDetailsModel = EventDetailsModel.fromJson(activity);
      loadData(activity);
      update(["Activity_update"]);
      return true;
    }
  }


//..............................Get My Acticity  ..................

  Future<bool> MyActivitie() async {
    final activity = await Activityrepository().MyActivity();
    print("Profile Fatch is : $activity");
    if (activity == null) {
      return false;
    } else {
      myActivityModel = MyActivityModel.fromJson(activity);
      update(["Activity_update"]);
      return true;
    }
  }


//.......................................Join Activity.......................

  Future<bool> joinActivity(String Activityid,
      String gusts,) async {
    final activity = await Activityrepository().JoinActivity(Activityid, gusts);
    print("Profile Fatch is : $activity");
    if (activity == null) {
      return false;
    } else {
      // dailyActivites = DailyActivitesModel.fromJson(activity);
      update(["Activity_update"]);
      return true;
    }
  }

//.......................................Join Event.......................

  Future<bool> joinEvent(String eventid) async {
    final activity = await Activityrepository().JoinEvent(eventid);
    print("Profile Fatch is : $activity");
    if (activity == null) {
      return false;
    } else {
      // dailyActivites = DailyActivitesModel.fromJson(activity);
      update(["Activity_update"]);
      return true;
    }
  }



  //.......................................Save Activity.......................

  Future<bool> saveActivity(String activityid,) async {
    final activity = await Activityrepository().SaveActivity(activityid);
    print("Profile Fatch is : $activity");
    if (activity == null) {
      return false;
    } else {
      // dailyActivites = DailyActivitesModel.fromJson(activity);
      update(["Activity_update"]);
      return true;
    }
  }

//.......................................Save Event.......................

  Future<bool> saveEvent(String Eventid,) async {
    final activity = await Activityrepository().SaveEvent(Eventid);
    print("Profile Fatch is : $activity");
    if (activity == null) {
      return false;
    } else {
      // dailyActivites = DailyActivitesModel.fromJson(activity);
      update(["Activity_update"]);
      return true;
    }
  }


  //..............................Get My SaveList  ..................

  Future<bool> SaveList() async {
    final activity = await Activityrepository().saveList();
    print("Profile Fatch is : $activity");
    if (activity == null) {
      return false;
    } else {
      savedEventsResponse = SavedEventsResponse.fromJson(activity);
      update(["Activity_update"]);
      return true;
    }
  }

//....................................... FilterActivity .......................

  Future<bool> FilterActivity(String Name, String date,String time,String range) async {
    final activity = await Activityrepository().FilterActivity(Name, date, time, range);
    print("Profile Fatch is : $activity");
    if (activity == null) {
      return false;
    } else {
      activityListModel = ActivityListModel.fromJson(activity);
      update(["Activity_update"]);
      return true;
    }
  }


//.......................................Leave Activity.......................

  Future<bool> LeaveActivity(String Activityid) async {
    final activity = await Activityrepository().LeaveActivies(Activityid);
    print("Profile Fatch is : $activity");
    if (activity == null) {
      return false;
    } else {
      // dailyActivites = DailyActivitesModel.fromJson(activity);
      update(["Activity_update"]);
      return true;
    }
  }

//.......................................Leave Event.......................

  Future<bool> LeaveEvent(String eventid) async {
    final activity = await Activityrepository().LeaveEvent(eventid);
    print("Profile Fatch is : $activity");
    if (activity == null) {
      return false;
    } else {
      // dailyActivites = DailyActivitesModel.fromJson(activity);
      update(["Activity_update"]);
      return true;
    }
  }

//.......................................Delete Activity.......................

  Future<bool> DeleteActivity(String eventid) async {
    final activity = await Activityrepository().DeleteActivity(eventid);
    print("Profile Fatch is : $activity");
    if (activity == null) {
      return false;
    } else {
      // dailyActivites = DailyActivitesModel.fromJson(activity);
      update(["Activity_update"]);
      return true;
    }
  }




}