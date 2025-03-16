class privacyModel {
  String? message;
  Privacy? privacy;

  privacyModel({this.message, this.privacy});

  privacyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    privacy =
    json['privacy'] != null ? new Privacy.fromJson(json['privacy']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.privacy != null) {
      data['privacy'] = this.privacy!.toJson();
    }
    return data;
  }
}

class Privacy {
  bool? traveller;
  bool? local;
  bool? male;
  bool? female;
  bool? nonBinary;
  bool? everyone;
  bool? privateMode;
  int? ageRangeMin;
  int? ageRangeMax;

  Privacy(
      {this.traveller,
        this.local,
        this.male,
        this.female,
        this.nonBinary,
        this.everyone,
        this.privateMode,
        this.ageRangeMin,
        this.ageRangeMax});

  Privacy.fromJson(Map<String, dynamic> json) {
    traveller = json['traveller'];
    local = json['local'];
    male = json['male'];
    female = json['female'];
    nonBinary = json['non_binary'];
    everyone = json['everyone'];
    privateMode = json['private_mode'];
    ageRangeMin = json['age_range_min'];
    ageRangeMax = json['age_range_max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['traveller'] = this.traveller;
    data['local'] = this.local;
    data['male'] = this.male;
    data['female'] = this.female;
    data['non_binary'] = this.nonBinary;
    data['everyone'] = this.everyone;
    data['private_mode'] = this.privateMode;
    data['age_range_min'] = this.ageRangeMin;
    data['age_range_max'] = this.ageRangeMax;
    return data;
  }
}
