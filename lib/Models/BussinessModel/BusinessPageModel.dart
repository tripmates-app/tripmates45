class BusinessPageModel {
  String? message;
  Profile? profile;
  int? totalEventsCreated;
  bool? isPremium;

  BusinessPageModel(
      {this.message, this.profile, this.totalEventsCreated, this.isPremium});

  BusinessPageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    totalEventsCreated = json['totalEventsCreated'];
    isPremium = json['isPremium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    data['totalEventsCreated'] = this.totalEventsCreated;
    data['isPremium'] = this.isPremium;
    return data;
  }
}

class Profile {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  Null? location;
  String? websiteLink;
  String? facebookLink;
  String? instagramLink;
  String? logo;
  String? image;
  String? description;

  Profile(
      {this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.location,
        this.websiteLink,
        this.facebookLink,
        this.instagramLink,
        this.logo,
        this.image,
        this.description});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    location = json['location'];
    websiteLink = json['website_link'];
    facebookLink = json['facebook_link'];
    instagramLink = json['instagram_link'];
    logo = json['logo'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['location'] = this.location;
    data['website_link'] = this.websiteLink;
    data['facebook_link'] = this.facebookLink;
    data['instagram_link'] = this.instagramLink;
    data['logo'] = this.logo;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}
