


import 'package:get/get.dart';
import 'package:tripmates/Models/ProfileModel.dart';
import 'package:tripmates/Repository/ProfileRespository.dart';

class ProfileController extends GetxController{

  profileModel? profile;


//.............................Get the profile

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










}