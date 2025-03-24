class MessageModel {
  final int id;
  final int senderId;
  final String senderName;
  final String message;
  final int groupId;
  final DateTime createdAt;
  final bool isSentByMe;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.message,
    required this.groupId,
    required this.createdAt,
    required this.isSentByMe,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json, String currentUserId) {
    return MessageModel(
      id: json['id'] ?? 0,
      senderId: json['senderId'] ?? 0,
      senderName: json['senderName']?.toString() ?? "Unknown",  // Ensure it's a string
      message: json['message']?.toString() ?? "No message",    // Ensure it's a string
      groupId: json['groupId'] ?? 0,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt']) ?? DateTime.now()
          : DateTime.now(),  // Ensure valid DateTime
      isSentByMe: json['senderId'].toString() == currentUserId,
    );
  }

}
