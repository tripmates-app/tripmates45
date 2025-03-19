class profileModel {
  String? userName;
  int? userId;
  String? onlineStatus;
  Profile? profile;
  Activities? activities;
  int? completionPercentage;

  profileModel(
      {this.userName,
        this.userId,
        this.onlineStatus,
        this.profile,
        this.activities,
        this.completionPercentage});

  profileModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userId = json['userId'];
    onlineStatus = json['onlineStatus'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    activities = json['activities'] != null
        ? new Activities.fromJson(json['activities'])
        : null;
    completionPercentage = json['completionPercentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['userId'] = this.userId;
    data['onlineStatus'] = this.onlineStatus;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    if (this.activities != null) {
      data['activities'] = this.activities!.toJson();
    }
    data['completionPercentage'] = this.completionPercentage;
    return data;
  }
}

class Profile {
  int? age;
  String? status;
  String? gender;
  String? bio;
  List<String>? interests;
  List<String>? images;
  String? location;
  String? coverImage;
  List<String>? language;

  Profile(
      {this.age,
        this.status,
        this.gender,
        this.bio,
        this.interests,
        this.images,
        this.location,
        this.coverImage,
        this.language});

  Profile.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    status = json['status'];
    gender = json['gender'];
    bio = json['bio'];
    interests = json['interests'].cast<String>();
    images = json['images'].cast<String>();
    location = json['location'];
    coverImage = json['coverImage'];
    language = json['Language'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['status'] = this.status;
    data['gender'] = this.gender;
    data['bio'] = this.bio;
    data['interests'] = this.interests;
    data['images'] = this.images;
    data['location'] = this.location;
    data['coverImage'] = this.coverImage;
    data['Language'] = this.language;
    return data;
  }
}

class Activities {
  int? created;
  int? joined;

  Activities({this.created, this.joined});

  Activities.fromJson(Map<String, dynamic> json) {
    created = json['created'];
    joined = json['joined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created'] = this.created;
    data['joined'] = this.joined;
    return data;
  }
}
