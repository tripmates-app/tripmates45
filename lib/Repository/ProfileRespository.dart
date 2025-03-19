
import "dart:convert";
import "dart:io";

import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";

import "../Constants/Apis_Constants.dart";

class ProfileRepository{

//......................................Get Profile Info................................

  Future<dynamic> GetProfile() async {

    try {
      SharedPreferences pref=await SharedPreferences.getInstance();
      final token= pref.getString("token");
      print("The token is :$token");
      final response = await http.get(
        Uri.parse(Apis.Profile),
        headers: {
          "Content-Type": "application/json",
          "Authorization":"Bearer $token"
        },
      );

      print("Status code : ${response.statusCode}");
      print("api response : ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print("Api Failed Status code : ${response.statusCode}");
        print("Api Failed response : ${response.body}");
        throw Exception("Failed to post data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error in POST: $e");
      return null;
    }
  }



//.....................................Get Gallery date....................................

  Future<dynamic> GetGallery() async {

    try {
      SharedPreferences pref=await SharedPreferences.getInstance();
      final token= pref.getString("token");
      print("The token is :$token");
      final response = await http.get(
        Uri.parse(Apis.GalleryList),
        headers: {
          "Content-Type": "application/json",
          "Authorization":"Bearer $token"
        },
      );

      print("Status code : ${response.statusCode}");
      print("api response : ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print("Api Failed Status code : ${response.statusCode}");
        print("Api Failed response : ${response.body}");
        throw Exception("Failed to post data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error in POST: $e");
      return null;
    }
  }


//...................................Upload Gallery Image.................................

  Future<dynamic> UploadGallery({required String description, File? image,}) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      print("The token is: $token");

      var uri = Uri.parse("${Apis.GalleryUpload}"); // Adjust API endpoint as needed
      var request = http.MultipartRequest("POST", uri);

      request.headers["Authorization"] = "Bearer $token";

      // ✅ Adding form fields
      request.fields["description"] = description;
      // ✅ Adding image only if provided
      if (image != null) {
        request.files.add(await http.MultipartFile.fromPath("images", image.path));
        print("Uploading Image: ${image.path}");
      } else {
        print("No image provided, skipping image upload.");
      }

      // ✅ Debugging: Print request details
      print("Sending PUT Request: ${request.fields}");

      // ✅ Sending request
      var response = await request.send();

      // ✅ Convert StreamedResponse to Readable Response
      var responseBody = await response.stream.bytesToString();
      print("Response Body: $responseBody");

      if (response.statusCode == 200) {
        print("✅ Activity updated successfully");
        return jsonDecode(responseBody); // Return parsed JSON
      } else {
        print("❌ Response Code: ${response.statusCode}");
        print("❌ Failed to update activity: $responseBody");
        return {"error": "Failed to update activity", "status": response.statusCode};
      }
    } catch (e) {
      print("⚠️ Exception Occurred: $e");
      return {"error": "An error occurred: $e"};
    }
  }


  //.....................................Get Total Activites ....................................

  Future<dynamic> GetTotalActivites() async {

    try {
      SharedPreferences pref=await SharedPreferences.getInstance();
      final token= pref.getString("token");
      print("The token is :$token");
      final response = await http.get(
        Uri.parse(Apis.TotalActivity),
        headers: {
          "Content-Type": "application/json",
          "Authorization":"Bearer $token"
        },
      );

      print("Status code : ${response.statusCode}");
      print("api response : ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print("Api Failed Status code : ${response.statusCode}");
        print("Api Failed response : ${response.body}");
        throw Exception("Failed to post data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error in POST: $e");
      return null;
    }
  }

  //.....................................Get Total Matches....................................

  Future<dynamic> GetTotalMatches() async {

    try {
      SharedPreferences pref=await SharedPreferences.getInstance();
      final token= pref.getString("token");
      print("The token is :$token");
      final response = await http.get(
        Uri.parse(Apis.TotalMatch),
        headers: {
          "Content-Type": "application/json",
          "Authorization":"Bearer $token"
        },
      );

      print("Status code : ${response.statusCode}");
      print("api response : ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print("Api Failed Status code : ${response.statusCode}");
        print("Api Failed response : ${response.body}");
        throw Exception("Failed to post data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error in POST: $e");
      return null;
    }
  }

  //.....................................Get Total joined Activites....................................

  Future<dynamic> GetTotalJoinedActivites() async {

    try {
      SharedPreferences pref=await SharedPreferences.getInstance();
      final token= pref.getString("token");
      print("The token is :$token");
      final response = await http.get(
        Uri.parse(Apis.JoinedActivites),
        headers: {
          "Content-Type": "application/json",
          "Authorization":"Bearer $token"
        },
      );

      print("Status code : ${response.statusCode}");
      print("api response : ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print("Api Failed Status code : ${response.statusCode}");
        print("Api Failed response : ${response.body}");
        throw Exception("Failed to post data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error in POST: $e");
      return null;
    }
  }


  //.....................................Get Total MatechsList....................................

  Future<dynamic> GetTotalMatchesList() async {

    try {
      SharedPreferences pref=await SharedPreferences.getInstance();
      final token= pref.getString("token");
      print("The token is :$token");
      final response = await http.get(
        Uri.parse(Apis.userMatches),
        headers: {
          "Content-Type": "application/json",
          "Authorization":"Bearer $token"
        },
      );

      print("Status code : ${response.statusCode}");
      print("api response : ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print("Api Failed Status code : ${response.statusCode}");
        print("Api Failed response : ${response.body}");
        throw Exception("Failed to post data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error in POST: $e");
      return null;
    }
  }

  //.....................................Get Total joined Activites List....................................

  Future<dynamic> GetTotalJoinedActivitesList() async {

    try {
      SharedPreferences pref=await SharedPreferences.getInstance();
      final token= pref.getString("token");
      print("The token is :$token");
      final response = await http.get(
        Uri.parse(Apis.ListJoinedActivites),
        headers: {
          "Content-Type": "application/json",
          "Authorization":"Bearer $token"
        },
      );

      print("Status code : ${response.statusCode}");
      print("api response : ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print("Api Failed Status code : ${response.statusCode}");
        print("Api Failed response : ${response.body}");
        throw Exception("Failed to post data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error in POST: $e");
      return null;
    }
  }


  //...................................Edite Profile Screen.................................

  Future<dynamic> editProfile({
    required String age,
    required String gender,
    required String status,
    required String bio,
    required List<String> interests,
    required List<String> language, // Renamed to lowercase for consistency
    required String longitude,
    required String latitude,
    required String userName,
    File? image,
    File? coverImage,
  }) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      print("The token is: $token");

      var uri = Uri.parse("${Apis.EditeProfile}"); // Adjust API endpoint as needed
      var request = http.MultipartRequest("PUT", uri);

      request.headers["Authorization"] = "Bearer $token";

      // ✅ Adding form fields
      request.fields["age"] = age;
      request.fields["gender"] = gender;
      request.fields["status"] = status;
      request.fields["bio"] = bio;
      request.fields["longitude"] = longitude;
      request.fields["latitude"] = latitude;
      request.fields["userName"] = userName;

      // ✅ Sending interests as a normal list (e.g., interests[0]=English, interests[1]=Urdu)
      for (var interest in interests) {
        request.fields["interests[]"] = interest;
      }

      // ✅ Sending languages as a normal list
      for (var lang in language) {
        request.fields["language[]"] = lang;
      }

      // ✅ Adding images only if provided
      if (image != null) {
        request.files.add(await http.MultipartFile.fromPath("images", image.path));
        print("Uploading Image: ${image.path}");
      } else {
        print("No profile image provided.");
      }

      if (coverImage != null) {
        request.files.add(await http.MultipartFile.fromPath("coverImage", coverImage.path));
        print("Uploading Cover Image: ${coverImage.path}");
      } else {
        print("No cover image provided.");
      }

      // ✅ Debugging: Print request details
      print("Sending PUT Request with fields: ${request.fields}");

      // ✅ Sending request
      var response = await request.send();

      // ✅ Convert StreamedResponse to Readable Response
      var responseBody = await response.stream.bytesToString();
      print("Response Body: $responseBody");

      if (response.statusCode == 200) {
        print("✅ Profile updated successfully");
        return jsonDecode(responseBody); // Return parsed JSON
      } else {
        print("❌ Response Code: ${response.statusCode}");
        print("❌ Failed to update profile: $responseBody");
        return {"error": "Failed to update profile", "status": response.statusCode};
      }
    } catch (e) {
      print("⚠️ Exception Occurred: $e");
      return {"error": "An error occurred: $e"};
    }
  }






}