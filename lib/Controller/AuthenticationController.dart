

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tripmates/Repository/AuthenticationRepository.dart';

class AuthenticationController extends GetxController{
 //..........................Signup.......................................
  TextEditingController username=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController Confermpassword=TextEditingController();
//..........................Login ..........................................
  TextEditingController loginemail=TextEditingController();
  TextEditingController loginpassword=TextEditingController();

//.................................Login User.................................
  Future<bool> LoginUser(
      String email,
      String password
      )async{
    final LoginUser= await AuthenticationRepository().LoginUser(email, password);
    print("LoginUser Fatch is : $LoginUser");
    if(LoginUser==null){
      return false;
    }else{
      // menutypeModel=MenutypeModel.fromJson(Menutype);
      return true;
    }

  }

//.................................SendOtp User.................................
  Future<bool> SendOtp(
      String userName, String email ,String password
      )async{
    final SendOtp= await AuthenticationRepository().SendOtp(userName, email, password);
    print("SendOtp Fatch is : $SendOtp");
    if(SendOtp==null){
      return false;
    }else{
      // menutypeModel=MenutypeModel.fromJson(Menutype);
      return true;
    }

  }

//.................................VerifyOtp User.................................
  Future<bool> VerifyOtp(
      String otp,
      String email
      )async{
    final VerifyOtp= await AuthenticationRepository().VerifyOtp(otp,email);
    print("VerifyOtp Fatch is : $VerifyOtp");
    if(VerifyOtp==null){
      return false;
    }else{
      // menutypeModel=MenutypeModel.fromJson(Menutype);
      return true;
    }

  }

  //.................................Login User.................................
  Future<bool> ForgotPassword(
      String oldPassword, String newPassword
      )async{
    final ForgotPassword= await AuthenticationRepository().ForgotPassword(oldPassword, newPassword);
    print("ForgotPassword Fatch is : $ForgotPassword");
    if(ForgotPassword==null){
      return false;
    }else{
      // menutypeModel=MenutypeModel.fromJson(Menutype);
      return true;
    }

  }

//...............................google Auth............................

  Future<bool> GoogleAuth(

      )async{
    final Google= await AuthenticationRepository().signInWithGoogle();
    return true;
    // print("Google signin is : $Google");
    // if(Google==null){
    //
    //   return false;
    // }else{
    //
    //   // menutypeModel=MenutypeModel.fromJson(Menutype);
    //   return true;
    // }

  }




}