

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;

import '../Constants/Apis_Constants.dart';

class Chatrespository{

//..........................................Get Privacy Policy.........................

  Future<Map<String, dynamic>?> StartConversation(String receiverId, String message,) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");
    print("The token is : $token");
    Map<String, dynamic> requestData = {
      "receiverId": receiverId,
      "message": message
    };
    try {
      final response = await http.post(
          Uri.parse(Apis.StartConverstaion),

          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token", // Add if required
          },
          body: jsonEncode(requestData)


      );
      print("The token is : ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body); // Return response as Map
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }


//................................... ChatList .............................

  Future<dynamic> ChatList() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      print("The token is : $token");



      // Constructing the URI with query parameters
      Uri uri = Uri.parse(Apis.GetChatsList);
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

//................................... GroupList .............................

  Future<dynamic> GroupList() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("token");
      print("The token is : $token");



      // Constructing the URI with query parameters
      Uri uri = Uri.parse(Apis.grouplist);
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


//................................... Mark as Read .............................

  Future<Map<String, dynamic>?> MarkasRead(String receiverId, ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");
    print("The token is : $token");
    Map<String, dynamic> requestData = {
      "senderId": receiverId,
    };
    try {
      final response = await http.put(
          Uri.parse(Apis.Markasread),

          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token", // Add if required
          },
          body: jsonEncode(requestData)


      );
      print("The status code is : ${response.statusCode}");
      print("The response  is : ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body); // Return response as Map
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }



//.................................GroupMessgaesSend.......................

  Future<Map<String, dynamic>?> StartConversation2(String receiverId, String message,) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");
    print("The token is : $token");
    Map<String, dynamic> requestData = {
      "groupId": receiverId,
      "message": message
    };
    try {
      final response = await http.post(
          Uri.parse(Apis.StartConverstaion),

          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token", // Add if required
          },
          body: jsonEncode(requestData)


      );
      print("The token is : ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body); // Return response as Map
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }




}