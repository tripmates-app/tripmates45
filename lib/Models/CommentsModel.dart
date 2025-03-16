class CommentsModel {
  String? message;
  List<Comment>? comments;

  CommentsModel({this.message, this.comments});

  factory CommentsModel.fromJson(Map<String, dynamic> json) {
    return CommentsModel(
      message: json['message'],
      comments: json['comments'] != null
          ? List<Comment>.from(json['comments'].map((c) => Comment.fromJson(c)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'comments': comments?.map((c) => c.toJson()).toList(),
    };
  }
}

class Comment {
  int? commentID;
  int? userId;
  int? activityId;
  int? parentCommentId;
  String? content;
  String? createdAt;
  String? updatedAt;
  List<Comment>? replies;
  User? user;

  Comment({
    this.commentID,
    this.userId,
    this.activityId,
    this.parentCommentId,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.replies,
    this.user,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      commentID: json['commentID'],
      userId: json['userId'],
      activityId: json['activityId'],
      parentCommentId: json['parentCommentId'],
      content: json['content'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      replies: json['replies'] != null
          ? List<Comment>.from(json['replies'].map((r) => Comment.fromJson(r)))
          : [],
      user: json['User'] != null ? User.fromJson(json['User']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'commentID': commentID,
      'userId': userId,
      'activityId': activityId,
      'parentCommentId': parentCommentId,
      'content': content,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'replies': replies?.map((r) => r.toJson()).toList(),
      'User': user?.toJson(),
    };
  }
}

class User {
  String? userName;
  UserProfile? userProfile;

  User({this.userName, this.userProfile});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['userName'],
      userProfile: json['userProfile'] != null
          ? UserProfile.fromJson(json['userProfile'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userProfile': userProfile?.toJson(),
    };
  }
}

class UserProfile {
  List<String>? images;

  UserProfile({this.images});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      images: json['images'] != null
          ? List<String>.from(json['images'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'images': images,
    };
  }
}
