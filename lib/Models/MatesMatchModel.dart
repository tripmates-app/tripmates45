class MatesMatchModel {
  bool? success;
  String? message;
  List<Mates>? mates;

  MatesMatchModel({this.success, this.message, this.mates});

  MatesMatchModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    mates = json['mates'] != null
        ? (json['mates'] as List).map((v) => Mates.fromJson(v)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'mates': mates?.map((v) => v.toJson()).toList(),
    };
  }
}

class Mates {
  int? userID;
  String? userName;
  String? email;
  String? password;
  bool? verified;
  bool? onlineStatus;
  String? fcmToken;
  List<dynamic>? blockedUsers;
  List<int>? likedActivities;
  String? createdAt;
  String? updatedAt;
  UserProfile? userProfile;

  Mates({
    this.userID,
    this.userName,
    this.email,
    this.password,
    this.verified,
    this.onlineStatus,
    this.fcmToken,
    this.blockedUsers,
    this.likedActivities,
    this.createdAt,
    this.updatedAt,
    this.userProfile,
  });

  Mates.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    verified = json['verified'];
    onlineStatus = json['onlineStatus'];
    fcmToken = json['fcmToken'];
    blockedUsers = json['blockedUsers'] != null ? List<dynamic>.from(json['blockedUsers']) : null;
    likedActivities = json['likedActivities'] != null ? List<int>.from(json['likedActivities']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userProfile = json['userProfile'] != null ? UserProfile.fromJson(json['userProfile']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'userName': userName,
      'email': email,
      'password': password,
      'verified': verified,
      'onlineStatus': onlineStatus,
      'fcmToken': fcmToken,
      'blockedUsers': blockedUsers,
      'likedActivities': likedActivities,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'userProfile': userProfile?.toJson(),
    };
  }
}

class UserProfile {
  List<String>? images;
  int? age;
  String? bio;
  List<String>? interests;
  String? longitude;
  String? latitude;
  String? countryFlag;

  UserProfile({
    this.images,
    this.age,
    this.bio,
    this.interests,
    this.longitude,
    this.latitude,
    this.countryFlag,
  });

  UserProfile.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null ? List<String>.from(json['images']) : null;
    age = json['age'];
    bio = json['bio'];
    interests = json['interests'] != null ? List<String>.from(json['interests']) : null;
    longitude = json['longitude'];
    latitude = json['latitude'];
    countryFlag = json['countryFlag'];
  }

  Map<String, dynamic> toJson() {
    return {
      'images': images,
      'age': age,
      'bio': bio,
      'interests': interests,
      'longitude': longitude,
      'latitude': latitude,
      'countryFlag': countryFlag,
    };
  }
}
