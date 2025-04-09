class BadgesModel {
  bool? success;
  List<Achievements>? achievements;

  BadgesModel({this.success, this.achievements});

  BadgesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['achievements'] != null) {
      achievements = <Achievements>[];
      json['achievements'].forEach((v) {
        achievements!.add(new Achievements.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.achievements != null) {
      data['achievements'] = this.achievements!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Achievements {
  int? id;
  String? name;
  String? description;
  String? icon;
  bool? hasClaimed;
  bool? unlocked;
  int? progress;

  Achievements(
      {this.id,
        this.name,
        this.description,
        this.icon,
        this.hasClaimed,
        this.unlocked,
        this.progress});

  Achievements.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    icon = json['icon'];
    hasClaimed = json['hasClaimed'];
    unlocked = json['unlocked'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['icon'] = this.icon;
    data['hasClaimed'] = this.hasClaimed;
    data['unlocked'] = this.unlocked;
    data['progress'] = this.progress;
    return data;
  }
}
