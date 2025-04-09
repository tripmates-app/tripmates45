class NotificationsModel {
  bool? success;
  List<Notifications>? notifications;

  NotificationsModel({this.success, this.notifications});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(new Notifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notifications {
  int? id;
  String? message;
  bool? isSeen;
  String? createdAt;

  Notifications({this.id, this.message, this.isSeen, this.createdAt});

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    isSeen = json['isSeen'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['isSeen'] = this.isSeen;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
