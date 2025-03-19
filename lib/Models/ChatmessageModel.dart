class MessageModel {
  final int id;
  final int senderId;
  final int conversationId;
  final int? groupId;
  final String message;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSentByMe;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.conversationId,
    this.groupId,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
    required this.isSentByMe,
  });

  // Convert JSON to MessageModel
  factory MessageModel.fromJson(Map<String, dynamic> json, String userId) {
    return MessageModel(
      id: json['id'],
      senderId: json['senderId'],
      conversationId: json['conversationId'],
      groupId: json['groupId'],
      message: json['message'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      isSentByMe: json['senderId'].toString() == userId,
    );
  }

  // Convert MessageModel to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "senderId": senderId,
      "conversationId": conversationId,
      "groupId": groupId,
      "message": message,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}
