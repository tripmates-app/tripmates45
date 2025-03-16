


import 'package:get/get.dart';
import 'package:tripmates/Models/MatePrfileViewModel.dart';
import 'package:tripmates/Models/ProfileModel.dart';
import 'package:tripmates/Repository/ProfileRespository.dart';
import 'package:tripmates/Repository/ViewProfileRepository.dart';

class Viewprofilecontroller extends GetxController{

  MateProfileViewModel? metaprofile;


//.............................Get the Mateprofile.....................
  Future<bool> GetProfileMates(String id)async{
    final Profile= await Viewprofilerepository().GetProfileMate(id);
    print("Profile Fatch is : $Profile");
    if(Profile==null){
      return false;
    }else{
      metaprofile = MateProfileViewModel.fromJson(Profile);
      update(["Profile_update"]);
      return true;
    }
  }










}