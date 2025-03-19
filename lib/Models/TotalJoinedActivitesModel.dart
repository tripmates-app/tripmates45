class TotalJoinedActivitesCount {
  bool? success;
  String? message;
  int? totalActivitiesJoined;

  TotalJoinedActivitesCount(
      {this.success, this.message, this.totalActivitiesJoined});

  TotalJoinedActivitesCount.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    totalActivitiesJoined = json['total_activities_joined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['total_activities_joined'] = this.totalActivitiesJoined;
    return data;
  }
}
