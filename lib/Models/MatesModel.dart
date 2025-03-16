class MatesModel {
  bool? success;
  String? message;
  List<Data>? data;

  MatesModel({this.success, this.message, this.data});

  MatesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null && json['data'] is List) {
      data = (json['data'] as List).map((v) => Data.fromJson(v)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? userID;
  String? userName;
  bool? onlineStatus;
  String? joinedDate;
  Profile? profile;

  Data({this.userID, this.userName, this.onlineStatus, this.joinedDate, this.profile});

  Data.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userName = json['userName'];
    onlineStatus = json['onlineStatus'];
    joinedDate = json['joinedDate'];
    profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userID'] = userID;
    data['userName'] = userName;
    data['onlineStatus'] = onlineStatus;
    data['joinedDate'] = joinedDate;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? profileID;
  List<String>? images;
  int? age;
  String? gender;

  Profile({this.profileID, this.images, this.age, this.gender});

  Profile.fromJson(Map<String, dynamic> json) {
    profileID = json['profileID'];
    images = json['images'] != null
        ? (json['images'] as List).map((e) => e.toString()).toList()
        : [];
    age = json['age'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['profileID'] = profileID;
    data['images'] = images;
    data['age'] = age;
    data['gender'] = gender;
    return data;
  }
}
