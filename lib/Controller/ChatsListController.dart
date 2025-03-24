import 'package:get/get.dart';
import 'package:tripmates/Models/ChatListModel.dart';
import 'package:tripmates/Repository/ChatRespository.dart';

import '../Models/GroupChatList.dart';

class ChatsListController extends GetxController {
  ChatListModel? chatListModel; // Removed Rxn
  GroupChatList?groupChatList;

  //.............................Get Chats List...........................
  Future<bool> Chatlist() async {
    final profile = await Chatrespository().ChatList();
    print("Profile Fetch is : $profile");

    if (profile == null) {
      return false;
    } else {
      chatListModel = ChatListModel.fromJson(profile); // Directly assign value
      update(["updateChats"]) ;// Notify GetX listeners
      return true;
    }
  }

  //.............................Get Chats List...........................
  Future<bool> GroupList() async {
    final profile = await Chatrespository().GroupList();
    print("Profile Fetch is : $profile");

    if (profile == null) {
      return false;
    } else {
      groupChatList = GroupChatList.fromJson(profile); // Directly assign value
      update(["updateChats"]) ;// Notify GetX listeners
      return true;
    }
  }

  //.............................Mark as Read...........................
  Future<bool> MarkAsRead(String senderid) async {
    final profile = await Chatrespository().MarkasRead(senderid);
    print("Profile Fetch is : $profile");

    if (profile == null) {
      return false;
    } else {
      // chatListModel = ChatListModel.fromJson(profile); // Directly assign value
      update(["updateChats"]) ;// Notify GetX listeners
      return true;
    }
  }



}
