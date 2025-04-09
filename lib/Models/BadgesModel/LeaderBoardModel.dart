class LeaderBoardModel {
  bool? success;
  List<RankedUsers>? rankedUsers;

  LeaderBoardModel({this.success, this.rankedUsers});

  LeaderBoardModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['rankedUsers'] != null) {
      rankedUsers = <RankedUsers>[];
      json['rankedUsers'].forEach((v) {
        rankedUsers!.add(new RankedUsers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.rankedUsers != null) {
      data['rankedUsers'] = this.rankedUsers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RankedUsers {
  int? rank;
  int? userId;
  String? name;
  List<String>? images;

  RankedUsers({this.rank, this.userId, this.name, this.images});

  RankedUsers.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    userId = json['userId'];
    name = json['name'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rank'] = this.rank;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['images'] = this.images;
    return data;
  }
}
