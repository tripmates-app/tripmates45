class ChatListModel {
  String? message;
  List<ChatList>? chatList;

  ChatListModel({this.message, this.chatList});

  ChatListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['chatList'] != null) {
      chatList = <ChatList>[];
      json['chatList'].forEach((v) {
        chatList!.add(new ChatList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.chatList != null) {
      data['chatList'] = this.chatList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatList {
  int? userID;
  String? userName;
  List<String>? profileImage;
  bool? isOnline;
  String? lastMessage;
  String? lastMessageTime;
  int? unreadMessages;
  int? conversationId;

  ChatList(
      {this.userID,
        this.userName,
        this.profileImage,
        this.isOnline,
        this.lastMessage,
        this.lastMessageTime,
        this.unreadMessages,
        this.conversationId});

  ChatList.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userName = json['userName'];
    profileImage = json['profileImage'].cast<String>();
    isOnline = json['isOnline'];
    lastMessage = json['lastMessage'];
    lastMessageTime = json['lastMessageTime'];
    unreadMessages = json['unreadMessages'];
    conversationId = json['conversationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['userName'] = this.userName;
    data['profileImage'] = this.profileImage;
    data['isOnline'] = this.isOnline;
    data['lastMessage'] = this.lastMessage;
    data['lastMessageTime'] = this.lastMessageTime;
    data['unreadMessages'] = this.unreadMessages;
    data['conversationId'] = this.conversationId;
    return data;
  }
}
