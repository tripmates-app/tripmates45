import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // For formatting date
import 'package:tripmates/Constants/Apis_Constants.dart';
import 'package:tripmates/Constants/utils.dart';
import '../Controller/ChatController.dart';
import '../Controller/ProfileController.dart';
import '../Models/ChatmessageModel.dart'; // Ensure MessageModel is imported

class ChatScreen extends StatefulWidget {
  final String providerName;
  final String CurrentUser;
  final String Image;
  final String Online;
  final String Conversationid;
  final String receiverId; // Add receiver ID to constructor

  const ChatScreen({
    Key? key,
    required this.providerName,
    required this.receiverId,
    required this.Image,
    required this.Online, required this.CurrentUser, required this.Conversationid,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String?currentuserid;
  ProfileController profileController=Get.put(ProfileController());
  final Chatcontroller chatController = Get.put(Chatcontroller());
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController(); // Added ScrollController

  @override
  void initState() {
    super.initState();
    chatController.initHive(widget.Conversationid);
    ever(chatController.messages, (_) => _scrollToBottom()); // Scroll when messages update
    profileController.GetProfile().then((_) {
     chatController.initSocketIO();
    });

  }




  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              controller: _scrollController, // Attach ScrollController
              itemCount: chatController.messages.length,
              itemBuilder: (context, index) {
                final MessageModel message = chatController.messages[index];
                final bool isSentByMe = message.isSentByMe;

                return Align(
                  alignment:
                  isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      gradient: isSentByMe
                          ? lefttorightgradient.withOpacity(0.4)
                          : const LinearGradient(
                          colors: [Color(0xffC6C6C6), Color(0xffC6C6C6)]),
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(10),
                        topRight: const Radius.circular(10),
                        bottomLeft: isSentByMe
                            ? const Radius.circular(10)
                            : Radius.zero,
                        bottomRight: isSentByMe
                            ? Radius.zero
                            : const Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          message.message, // Correct field name
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          DateFormat('hh:mm a').format(message.createdAt),
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
          ),
          _buildInputSection(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      surfaceTintColor: Theme.of(context).cardColor,
      backgroundColor: Theme.of(context).cardColor,
      toolbarHeight: 83,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 3,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff4F78DA),
                Color(0xff339003),
              ]),
            ),
          )
        ],
      ),
      title: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(widget.Image),
              ),
              if (widget.Online == "Active")
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 13,
                    width: 13,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Center(
                      child: CircleAvatar(
                        radius: 5.5,
                        backgroundColor: Color(0xff339003),
                      ),
                    ),
                  ),
                )
            ],
          ),
          const SizedBox(width: 10),
          Text(widget.providerName),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: SvgPicture.asset(
            'assets/Group 48096195 (1).svg',
            height: 27,
          ),
        ),
      ],
    );
  }

  Widget _buildInputSection() {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(color: Colors.green, blurRadius: 3, spreadRadius: 1.1),
          ]),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffF1F1F1),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SvgPicture.asset(
                        'assets/Group 48095945.svg',
                        height: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          hintText: 'Message',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/Group 48095946.svg',
                      height: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: _sendMessage,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 15),
                child: SvgPicture.asset(
                  'assets/sen.svg',
                  height: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    final String messageText = _messageController.text.trim();
    if (messageText.isEmpty) return;

    chatController.sendMessage(widget.receiverId, messageText);
    _messageController.clear();
    _scrollToBottom(); // Scroll after sending a message
  }
}
