class NearbyMates {
  String? message;
  List<Users>? users;

  NearbyMates({this.message, this.users});

  NearbyMates.fromJson(Map<String, dynamic> json) {
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
  int? profileID;
  int? userID;
  List<String>? images;
  String? bio;
  String? countryFlag;
  String? gender;
  List<String>? interests;
  String? latitude;
  String? longitude;
  String? status;
  int? age;
  User? user;
  String? distance;
  bool? hasLiked;

  Users(
      {this.profileID,
        this.userID,
        this.images,
        this.bio,
        this.countryFlag,
        this.gender,
        this.interests,
        this.latitude,
        this.longitude,
        this.status,
        this.age,
        this.user,
        this.distance,
        this.hasLiked = false,
      });

  Users.fromJson(Map<String, dynamic> json) {
    profileID = json['profileID'];
    userID = json['userID'];
    images = json['images'].cast<String>();
    bio = json['bio'];
    countryFlag = json['countryFlag'];
    gender = json['gender'];
    interests = json['interests'].cast<String>();
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
    age = json['age'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
    distance = json['distance'];
    hasLiked = json['hasLiked'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profileID'] = this.profileID;
    data['userID'] = this.userID;
    data['images'] = this.images;
    data['bio'] = this.bio;
    data['countryFlag'] = this.countryFlag;
    data['gender'] = this.gender;
    data['interests'] = this.interests;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['status'] = this.status;
    data['age'] = this.age;
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    data['distance'] = this.distance;
    data['hasLiked'] = this.hasLiked;
    return data;
  }
}

class User {
  String? userName;

  User({this.userName});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    return data;
  }
}
