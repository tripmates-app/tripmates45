import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'package:tripmates/Constants/custom_appbar.dart';
import 'package:tripmates/Constants/drawer_screen.dart';
import 'package:tripmates/Constants/listdata.dart';
import 'package:tripmates/Constants/utils.dart';

import '../ChatScreens/chat_screen.dart';

class BusinessmessagesScreen extends StatefulWidget {
  const BusinessmessagesScreen({super.key});

  @override
  State<BusinessmessagesScreen> createState() => _BusinessmessagesScreenState();
}

class _BusinessmessagesScreenState extends State<BusinessmessagesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, String>> _chatUsers = [
    {
      "name": "John Doe",
      "lastMessage": "Hey! How are you?",
      "time": "3:45 PM",
    },
    {
      "name": "Jane Smith",
      "lastMessage": "Let’s catch up soon!",
      "time": "2:15 PM",
    },
    {
      "name": "Alex Brown",
      "lastMessage": "Can you send the details?",
      "time": "1:00 PM",
    },
    {
      "name": "Emily White",
      "lastMessage": "Great! See you tomorrow.",
      "time": "12:30 PM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerScreen(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(83), child: Businessappbar(scaffoldKey: _scaffoldKey,)),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Messages',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SvgPicture.asset(
                  'assets/sea.svg',
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ListView.builder(
              itemCount: _chatUsers.length,
              itemBuilder: (context, index) {
                final user = _chatUsers[index];
                return _buildChatCard(
                  context,
                  name: user["name"]!,
                  lastMessage: user["lastMessage"]!,
                  time: user["time"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatCard(
    BuildContext context, {
    required String name,
    required String lastMessage,
    required String time,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        ListTile(
          minTileHeight: 50,
          leading: Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                      'assets/Group 48096083.png') // Custom red color
                  ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 13,
                  width: 13,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: whiteColor),
                  child: Center(
                    child: Container(
                      height: 11,
                      width: 11,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xff339003)),
                    ),
                  ),
                ),
              )
            ],
          ),
          title: Row(
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              SvgPicture.asset(
                'assets/verify.svg',
                height: 14,
              )
            ],
          ),
          subtitle: Text(
            lastMessage,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: GradientText(time, colors: [
            Color(0xff007BFD),
            Color(0xff20235A),
          ]),
          onTap: () {
            // Navigate to the chat detail screen
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ChatScreen(providerName: name),
            //   ),
            // );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 20),
          child: Divider(
            color: Colors.grey.withOpacity(0.3),
          ),
        )
      ],
    );
  }
}
