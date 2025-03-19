


import 'dart:io';

import 'package:get/get.dart';
import 'package:tripmates/Models/GalleryDataModel.dart';
import 'package:tripmates/Models/ProfileModel.dart';
import 'package:tripmates/Models/TotalActivityCount.dart';
import 'package:tripmates/Models/TotalJoinedActivitesModel.dart';
import 'package:tripmates/Models/TotalMatchCount.dart';
import 'package:tripmates/Models/TotalMatchListModel.dart';
import 'package:tripmates/Repository/ProfileRespository.dart';

import '../Models/JoinedActivityModel.dart';

class ProfileController extends GetxController{

  profileModel? profile;
  GalleryDataModel?galleryDataModel;
  TotalActivityCount?totalActivityCount;
  TotalJoinedActivitesCount?totalJoinedActivitesCount;
  TotalMatchCount?totalMatchCount;
  JoinedActivitesModel?joinedActivitesModel;
  TotalMatchListModel?totalMatchListModel;


//.............................Get the profile...........................

  Future<bool> GetProfile()async{
    final Profile= await ProfileRepository().GetProfile();
    print("Profile Fatch is : $Profile");
    if(Profile==null){
      return false;
    }else{
      profile = profileModel.fromJson(Profile);
      update(["Profile_update"]);
      return true;
    }
  }

//.............................Get Gallery List...........................

  Future<bool> GetGalleryList()async{
    final Profile= await ProfileRepository().GetGallery();
    print("Profile Fatch is : $Profile");
    if(Profile==null){
      return false;
    }else{
      galleryDataModel = GalleryDataModel.fromJson(Profile);
      update(["Profile_update"]);
      return true;
    }
  }



  //.............................Upload Gallery List...........................

  Future<bool> UploadGallery(
     String description, // ID of the activity to update
      File? image, // Image is optional
      )async{
    final Profile= await ProfileRepository().UploadGallery(description: description,image: image);
    print("Profile Fatch is : $Profile");
    if(Profile==null){
      return false;
    }else{
      profile = profileModel.fromJson(Profile);
      update(["Profile_update"]);
      return true;
    }
  }


  //.............................Get Total Activities...........................

  Future<bool> TotalActivites()async{
    final Profile= await ProfileRepository().GetTotalActivites();
    print("Profile Fatch is : $Profile");
    if(Profile==null){
      return false;
    }else{
      totalActivityCount = TotalActivityCount.fromJson(Profile);
      update(["Profile_update"]);
      return true;
    }
  }

  //.............................Get Total Matcehs...........................

  Future<bool> TotalMatches()async{
    final Profile= await ProfileRepository().GetTotalMatches();
    print("Profile Fatch is : $Profile");
    if(Profile==null){
      return false;
    }else{
      totalMatchCount = TotalMatchCount.fromJson(Profile);
      update(["Profile_update"]);
      return true;
    }
  }

  //.............................Get Total joined Activities...........................

  Future<bool> JoinedActivites()async{
    final Profile= await ProfileRepository().GetTotalJoinedActivites();
    print("Profile Fatch is : $Profile");
    if(Profile==null){
      return false;
    }else{
      totalJoinedActivitesCount = TotalJoinedActivitesCount.fromJson(Profile);
      update(["Profile_update"]);
      return true;
    }
  }


  //.............................Get Total Matcehs List...........................

  Future<bool> TotalMatchesList()async{
    final Profile= await ProfileRepository().GetTotalMatchesList();
    print("Profile Fatch is : $Profile");
    if(Profile==null){
      return false;
    }else{
      totalMatchListModel = TotalMatchListModel.fromJson(Profile);
      update(["Profile_update"]);
      return true;
    }
  }

  //.............................Get Total joined Activities List...........................

  Future<bool> JoinedActivitesList()async{
    final Profile= await ProfileRepository().GetTotalJoinedActivitesList();
    print("Profile Fatch is : $Profile");
    if(Profile==null){
      return false;
    }else{
      joinedActivitesModel = JoinedActivitesModel.fromJson(Profile);
      update(["Profile_update"]);
      return true;
    }
  }


//................................Edite Profile.........................


  Future<bool> editProfile({
    required String age,
    required String gender,
    required String status,
    required String bio,
    required List<String> interests,
    required List<String> Language,
    required String longitude,
    required String latitude,
    required String userName,
    File? image,
    File? coverImage,
  }) async {
    try {
      final profile = await ProfileRepository().editProfile(
        age: age,
        gender: gender,
        status: status,
        bio: bio,
        interests: interests,
        language: Language,
        longitude: longitude,
        latitude: latitude,
        userName: userName,
        image: image,
        coverImage: coverImage,
      );

      print("Profile Fetch Response: $profile");

      if (profile == null) {
        return false;
      } else {
        // joinedActivitesModel = JoinedActivitesModel.fromJson(profile);
        update(["Profile_update"]);
        return true;
      }
    } catch (e) {
      print("⚠️ Error updating profile: $e");
      return false;
    }
  }






}