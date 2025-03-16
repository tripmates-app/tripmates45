class MateProfileViewModel {
  String? message;
  User? user;
  Profile? profile;

  MateProfileViewModel({this.message, this.user, this.profile});

  MateProfileViewModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class User {
  String? userName;
  bool? onlineStatus;

  User({this.userName, this.onlineStatus});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    onlineStatus = json['onlineStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['onlineStatus'] = this.onlineStatus;
    return data;
  }
}

class Profile {
  int? age;
  String? gender;
  String? status;
  String? bio;
  List<String>? interests;
  List<String>? images;
  String? country;
  List<String>? language;
  String? countryFlag;
  Location? location;

  Profile(
      {this.age,
        this.gender,
        this.status,
        this.bio,
        this.interests,
        this.images,
        this.country,
        this.language,
        this.countryFlag,
        this.location});

  Profile.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    gender = json['gender'];
    status = json['status'];
    bio = json['bio'];
    interests = json['interests'].cast<String>();
    images = json['images'].cast<String>();
    country = json['country'];
    language = json['language'].cast<String>();
    countryFlag = json['countryFlag'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['status'] = this.status;
    data['bio'] = this.bio;
    data['interests'] = this.interests;
    data['images'] = this.images;
    data['country'] = this.country;
    data['language'] = this.language;
    data['countryFlag'] = this.countryFlag;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Location {
  String? longitude;
  String? latitude;

  Location({this.longitude, this.latitude});

  Location.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}
