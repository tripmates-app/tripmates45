class TotalActivityCount {
  bool? success;
  String? message;
  int? totalActivitiesCreated;

  TotalActivityCount({this.success, this.message, this.totalActivitiesCreated});

  TotalActivityCount.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    totalActivitiesCreated = json['total_activities_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['total_activities_created'] = this.totalActivitiesCreated;
    return data;
  }
}
