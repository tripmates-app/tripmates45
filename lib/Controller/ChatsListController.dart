import 'package:get/get.dart';
import 'package:tripmates/Models/ChatListModel.dart';
import 'package:tripmates/Repository/ChatRespository.dart';

class ChatsListController extends GetxController {
  ChatListModel? chatListModel; // Removed Rxn

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
}
