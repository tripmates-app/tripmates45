class BusinessstatusModel {
  bool? success;
  bool? hasBusinessProfile;

  BusinessstatusModel({this.success, this.hasBusinessProfile});

  BusinessstatusModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    hasBusinessProfile = json['hasBusinessProfile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['hasBusinessProfile'] = this.hasBusinessProfile;
    return data;
  }
}
