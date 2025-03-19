

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





}