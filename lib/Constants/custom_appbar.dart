import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tripmates/Auth_Screens/login_screen.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Theme.of(context).cardColor,
      backgroundColor: Theme.of(context).cardColor,
      toolbarHeight: 75,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 3,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xff4F78DA),
              Color(0xff339003),
            ])),
          )
        ],
      ),
      leadingWidth: 60,
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 20,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/Union.svg',
              color: Theme.of(context).primaryColor,
              height: 21,
            ),
          ],
        ),
      ),
      title: Container(
        height: 38,
        child: TextFormField(
          style: TextStyle(fontSize: 13, color: Colors.black),
          cursorHeight: 15,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).hoverColor,
            enabled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            border: InputBorder.none,
            prefixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/Vector.svg',
                  height: 17,
                )
              ],
            ),
            hintText: 'Find friends, activities, or places nearby..',
            hintStyle: TextStyle(
              fontSize: 9,
              color: Colors.black,
            ),
          ),
        ),
      ),
      actions: [
        SvgPicture.asset(
          'assets/Vector (1).svg',
          height: 25,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(
          width: 13,
        ),
        TextButton(
          onPressed: (){

            Get.offAll(()=> LoginScreen());
          },
          child: Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: Icon(
              Icons.notifications_outlined,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
