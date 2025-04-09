class GroupChatList {
  String? message;
  List<GroupList>? groupList;

  GroupChatList({this.message, this.groupList});

  GroupChatList.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['groupList'] != null) {
      groupList = <GroupList>[];
      json['groupList'].forEach((v) {
        groupList!.add(GroupList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (groupList != null) {
      data['groupList'] = groupList!.map((v) => v.toJson()).toList();
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

  GroupList({
    this.groupId,
    this.groupName,
    this.groupImage = const [], // default to empty list
    this.createdAt,
    this.lastMessage,
    this.lastMessageTime,
    this.unreadMessages,
  });

  GroupList.fromJson(Map<String, dynamic> json) {
    groupId = json['groupId'];
    groupName = json['groupName'];

    // Safe handling of groupImage
    if (json['groupImage'] != null && json['groupImage'] is List) {
      groupImage = List<String>.from(json['groupImage']);
    } else {
      groupImage = [];
    }

    createdAt = json['createdAt'];
    lastMessage = json['lastMessage'];
    lastMessageTime = json['lastMessageTime'];
    unreadMessages = json['unreadMessages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['groupId'] = groupId;
    data['groupName'] = groupName;
    data['groupImage'] = groupImage;
    data['createdAt'] = createdAt;
    data['lastMessage'] = lastMessage;
    data['lastMessageTime'] = lastMessageTime;
    data['unreadMessages'] = unreadMessages;
    return data;
  }
}
