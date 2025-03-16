class MateListModel {
  String? message;
  List<Users>? users;

  MateListModel({this.message, this.users});

  MateListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  int? userID;
  String? userName;
  String? email;
  String? password;
  bool? verified;
  bool? onlineStatus;
  String? fcmToken;
  List<int>? blockedUsers;
  List<int>? likedActivities;
  String? createdAt;
  String? updatedAt;
  UserProfile? userProfile;

  Users(
      {this.userID,
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
        this.userProfile});

  Users.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    verified = json['verified'];
    onlineStatus = json['onlineStatus'];
    fcmToken = json['fcmToken'];
    blockedUsers = json['blockedUsers'].cast<int>();
    likedActivities = json['likedActivities'].cast<int>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userProfile = json['userProfile'] != null
        ? new UserProfile.fromJson(json['userProfile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['verified'] = this.verified;
    data['onlineStatus'] = this.onlineStatus;
    data['fcmToken'] = this.fcmToken;
    data['blockedUsers'] = this.blockedUsers;
    data['likedActivities'] = this.likedActivities;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.userProfile != null) {
      data['userProfile'] = this.userProfile!.toJson();
    }
    return data;
  }
}

class UserProfile {
  List<String>? images;
  int? age;
  String? bio;
  List<String>? interests;
  String? longitude;
  String? latitude;

  UserProfile(
      {this.images,
        this.age,
        this.bio,
        this.interests,
        this.longitude,
        this.latitude});

  UserProfile.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
    age = json['age'];
    bio = json['bio'];
    interests = json['interests'].cast<String>();
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    data['age'] = this.age;
    data['bio'] = this.bio;
    data['interests'] = this.interests;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}
