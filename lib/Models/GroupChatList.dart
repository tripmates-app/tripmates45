class GroupChatList {
  String? message;
  List<GroupList>? groupList;

  GroupChatList({this.message, this.groupList});

  GroupChatList.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['groupList'] != null) {
      groupList = <GroupList>[];
      json['groupList'].forEach((v) {
        groupList!.add(new GroupList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.groupList != null) {
      data['groupList'] = this.groupList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroupList {
  int? groupId;
  String? groupName;
  List<String>? groupImage;
  String? createdAt;
  String? lastMessage;
  String? lastMessageTime;
  int? unreadMessages;

  GroupList(
      {this.groupId,
        this.groupName,
        this.groupImage,
        this.createdAt,
        this.lastMessage,
        this.lastMessageTime,
        this.unreadMessages});

  GroupList.fromJson(Map<String, dynamic> json) {
    groupId = json['groupId'];
    groupName = json['groupName'];
    groupImage = json['groupImage'].cast<String>();
    createdAt = json['createdAt'];
    lastMessage = json['lastMessage'];
    lastMessageTime = json['lastMessageTime'];
    unreadMessages = json['unreadMessages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupId'] = this.groupId;
    data['groupName'] = this.groupName;
    data['groupImage'] = this.groupImage;
    data['createdAt'] = this.createdAt;
    data['lastMessage'] = this.lastMessage;
    data['lastMessageTime'] = this.lastMessageTime;
    data['unreadMessages'] = this.unreadMessages;
    return data;
  }
}
