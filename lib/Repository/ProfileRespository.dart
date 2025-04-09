
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



//................................UpdateUser Location............................
  Future<Map<String, dynamic>> UpdateLocation(double latitude, double longitude,) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");
    print("The token is : $token");
    Map<String, dynamic> requestData = {
      "latitude":latitude ,
      "longitude":longitude
    };
    print("The Lcation is : $requestData");
    try {
      final response = await http.put(
        Uri.parse(Apis.UpdateLocation),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token", // Add if required
        },
        body: jsonEncode(requestData),
      );
      print("the location update with :${response.statusCode}");
      print("the location update with :${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body); // Return response as Map
      } else {
        return {
          "success": false,
          "statusCode": response.statusCode,
          "message": "Error: ${response.body}",
        };
      }
    } catch (e) {
      return {
        "success": false,
        "message": "Exception: $e",
      };
    }
  }



//................................Update FCM Token................................


  Future<Map<String, dynamic>> UpdateFCMToken(String fcmToken) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");
    print("The token is : $token");
    Map<String, dynamic> requestData = {
      "fcmToken":fcmToken ,

    };
    try {
      final response = await http.post(
        Uri.parse(Apis.UpdateFCMToken),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token", // Add if required
        },
        body: jsonEncode(requestData),
      );
      print("the FCM update with :${response.statusCode}");
      print("the FCM update with :${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body); // Return response as Map
      } else {
        return {
          "success": false,
          "statusCode": response.statusCode,
          "message": "Error: ${response.body}",
        };
      }
    } catch (e) {
      return {
        "success": false,
        "message": "Exception: $e",
      };
    }
  }


//......................Setup Profile .......................................

  Future<bool> setupProfile({
    required int age,
    required String gender,
    required String status,
    required String username,
    required String bio,
    required String country,
    required List<String> interests,
    required File image,
    required File coverImage,
    required double latitude,
    required double longitude,
    required List<String> languages,
    required String location,
  }) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");

      print("The token is: $token");

      var uri = Uri.parse(Apis.SetupProfile);
      var request = http.MultipartRequest("POST", uri);
      print("The URl is: $uri");

      request.headers["Authorization"] = "Bearer $token";
      request.headers["Content-Type"] = "multipart/form-data";

      request.fields['age'] = age.toString();
      request.fields['gender'] = gender;
      request.fields['status'] = status;
      request.fields['bio'] = bio;
      request.fields['country'] = country;
      request.fields['latitude'] = latitude.toString();
      request.fields['longitude'] = longitude.toString();
      request.fields['location'] = location;

      // Add interests as array
      for (var interest in interests) {
        request.fields['interests[]'] = interest;
      }

      // Add languages as array
      for (var lang in languages) {
        request.fields['language[]'] = lang;
      }

      print("Interests being sent: $interests");
      print("Languages being sent: $languages");

      request.files.add(await http.MultipartFile.fromPath(
        'images',
        image.path,
        filename: 'profile_${DateTime.now().millisecondsSinceEpoch}.jpg',
      ));

      request.files.add(await http.MultipartFile.fromPath(
        'coverImage',
        coverImage.path,
        filename: 'cover_${DateTime.now().millisecondsSinceEpoch}.jpg',
      ));

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: $responseBody");

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("✅ Profile setup successful!");
        var responseData = jsonDecode(responseBody);
        print("Server response: $responseData");
        return true;
      } else {
        print("❌ Failed to set up profile: ${response.reasonPhrase}");
        print("Full error response: $responseBody");
        return false;
      }
    } catch (e) {
      print("⚠️ Error in profile setup: $e");
      if (e is http.ClientException) {
        print("Network error: ${e.message}");
      }
      return false;
    }
  }




//.......................................ChangePassword............................



  Future<bool> changePassword(String oldPassword, String newPassword) async {
    // Replace with actual API URL

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");

      print("The token is: $token");
      final response = await http.put(
        Uri.parse(Apis.changepassword),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Include authentication if required
        },
        body: jsonEncode({
          'oldPassword': oldPassword,
          'newPassword': newPassword,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return true;
        print('Password changed successfully: ${data['message']}');
      } else {
        print('Failed to change password: ${response.body}');
        return false;
      }
    } catch (e) {
      return false;
      print('Error: $e');
    }
  }


//............................Badges........................................

  Future<dynamic> BadgesList( ) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      print("The token is : $token");

      Map<String,dynamic> queryParams={
        "filterType":"all"
      };

      // Constructing the URI with query parameters
      Uri uri = Uri.parse(Apis.BadgesList);
      print("The URl is : $uri");

      final response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print("Status code : ${response.statusCode}");
      print("API response : ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print("API Failed Status code : ${response.statusCode}");
        print("API Failed response : ${response.body}");
        throw Exception("Failed to fetch data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error in GET: $e");
      return null;
    }
  }


//...........................Claimed Badges...........................

  Future<dynamic> ClaimedBadges (String id,) async {

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      print("The token is : $token");
      final response = await http.post(
        Uri.parse(Apis.BadgesVerified),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "achievementId":id,

        }
        ),
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


//..........................LeaderBoard.......................................



  Future<dynamic> LeaderBoard( ) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      print("The token is : $token");

      Map<String,dynamic> queryParams={
        "filterType":"all"
      };

      // Constructing the URI with query parameters
      Uri uri = Uri.parse(Apis.LeaderBoard);
      print("The URl is : $uri");

      final response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print("Status code : ${response.statusCode}");
      print("API response : ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print("API Failed Status code : ${response.statusCode}");
        print("API Failed response : ${response.body}");
        throw Exception("Failed to fetch data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error in GET: $e");
      return null;
    }
  }


//..........................LeaderBoard.......................................



  Future<dynamic> Notifications( ) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      print("The token is : $token");

      Map<String,dynamic> queryParams={
        "filterType":"all"
      };

      // Constructing the URI with query parameters
      Uri uri = Uri.parse(Apis.NotificationScreen);
      print("The URl is : $uri");

      final response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print("Status code : ${response.statusCode}");
      print("API response : ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print("API Failed Status code : ${response.statusCode}");
        print("API Failed response : ${response.body}");
        throw Exception("Failed to fetch data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error in GET: $e");
      return null;
    }
  }




//..........................Online.......................................

  Future<dynamic> Online( ) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      print("The token is : $token");

      Map<String,dynamic> queryParams={
        "filterType":"all"
      };

      // Constructing the URI with query parameters
      Uri uri = Uri.parse(Apis.online);
      print("The URl is : $uri");

      final response = await http.put(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print("Status code : ${response.statusCode}");
      print("API response : ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print("API Failed Status code : ${response.statusCode}");
        print("API Failed response : ${response.body}");
        throw Exception("Failed to fetch data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error in GET: $e");
      return null;
    }
  }

  //..........................Offline.......................................

  Future<dynamic> Offline( ) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      print("The token is : $token");

      Map<String,dynamic> queryParams={
        "filterType":"all"
      };

      // Constructing the URI with query parameters
      Uri uri = Uri.parse(Apis.offline);
      print("The URl is : $uri");

      final response = await http.put(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print("Status code : ${response.statusCode}");
      print("API response : ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print("API Failed Status code : ${response.statusCode}");
        print("API Failed response : ${response.body}");
        throw Exception("Failed to fetch data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error in GET: $e");
      return null;
    }
  }




}