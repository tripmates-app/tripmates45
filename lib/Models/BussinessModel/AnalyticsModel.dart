class AnalyticsModel {
  String? message;
  Analytics? analytics;

  AnalyticsModel({this.message, this.analytics});

  AnalyticsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    analytics = json['analytics'] != null
        ? new Analytics.fromJson(json['analytics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.analytics != null) {
      data['analytics'] = this.analytics!.toJson();
    }
    return data;
  }
}

class Analytics {
  Total? total;
  Total? daily;
  Total? weekly;
  Total? monthly;

  Analytics({this.total, this.daily, this.weekly, this.monthly});

  Analytics.fromJson(Map<String, dynamic> json) {
    total = json['total'] != null ? new Total.fromJson(json['total']) : null;
    daily = json['daily'] != null ? new Total.fromJson(json['daily']) : null;
    weekly = json['weekly'] != null ? new Total.fromJson(json['weekly']) : null;
    monthly =
    json['monthly'] != null ? new Total.fromJson(json['monthly']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.total != null) {
      data['total'] = this.total!.toJson();
    }
    if (this.daily != null) {
      data['daily'] = this.daily!.toJson();
    }
    if (this.weekly != null) {
      data['weekly'] = this.weekly!.toJson();
    }
    if (this.monthly != null) {
      data['monthly'] = this.monthly!.toJson();
    }
    return data;
  }
}

class Total {
  int? views;
  int? clicks;
  int? joins;
  int? followers;

  Total({this.views, this.clicks, this.joins, this.followers});

  Total.fromJson(Map<String, dynamic> json) {
    views = json['views'];
    clicks = json['clicks'];
    joins = json['joins'];
    followers = json['followers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['views'] = this.views;
    data['clicks'] = this.clicks;
    data['joins'] = this.joins;
    data['followers'] = this.followers;
    return data;
  }
}
