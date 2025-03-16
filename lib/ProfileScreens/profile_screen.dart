import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tripmates/Constants/button.dart';
import 'package:tripmates/Constants/utils.dart';
import 'package:tripmates/ProfileScreens/profileview_screen.dart';
import 'package:tripmates/ProfileScreens/visibilityandpreferences_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double percent = 0.53;
  _percentage(percent) {
    var value = percent * 100;
    return ('$value%');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 63,
            ),
            InkWell(
              onTap: (){
                Get.to(()=> ProfileViewScreen());
              },
              child: Card(
                elevation: 3,
                color: Theme.of(context).cardColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(19),
                        bottomRight: Radius.circular(19))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, right: 20, bottom: 13),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: CircularPercentIndicator(
                                    radius: 49.0,
                                    lineWidth: 5.0,
                                    percent: percent,
                                    progressBorderColor: Color(0xff4F78DA),
                                    center: CircleAvatar(
                                      radius: 43,
                                      backgroundImage: AssetImage(
                                        'assets/Group 48096083.png',
                                      ),
                                    ),
                                    progressColor: Color(0xff4F78DA),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff4F78DA)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                        child: Text(
                                      _percentage(percent),
                                      style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                          color: whiteColor),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Muhammad Ali Khan, 24, Male',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '@AliKhan',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Theme.of(context).indicatorColor,
                                    ),
                                  ),
                                  Text(
                                    'Complete your profile ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff4F78DA),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 33,
                            ),
                            SvgPicture.asset(
                              'assets/Group 48095973.svg',
                              height: 21,
                              color: Theme.of(context).primaryColor,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 3, spreadRadius: 4, color: Colors.black12)
                  ],
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(19),
                      topRight: Radius.circular(19))),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset('assets/Group 48095962.png'),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/verify.svg',
                                height: 23,
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Expanded(
                                child: Text(
                                    'Verify your profile to build trust and enhance visibility to others.'),
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff007BFD),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Center(
                                      child: Text(
                                        'Get Verified',
                                        style: TextStyle(color: whiteColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2.3,
                      color: Color(0xffF1F1F1),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(()=>VisibilityandpreferencesScreen());
                      },
                      child: ListTile(
                        leading: SvgPicture.asset('assets/Group 48095968.svg'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        title: Text(
                          "Visibility and Preferences",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2.3,
                      color: Color(0xffF1F1F1),
                    ),
                    ListTile(
                      leading: SvgPicture.asset('assets/SET.svg'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      title: Text(
                        "Setting & privacy",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      thickness: 2.3,
                      color: Color(0xffF1F1F1),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/bar.svg',
                        height: 17,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      title: Text(
                        "Business Features",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      thickness: 2.3,
                      color: Color(0xffF1F1F1),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/ach.svg',
                        height: 14,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      title: Text(
                        "Linked Accounts",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      thickness: 2.3,
                      color: Color(0xffF1F1F1),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/gam.svg',
                        height: 16,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      title: Text(
                        "Achievements & Rewards",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      thickness: 2.3,
                      color: Color(0xffF1F1F1),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/Group 48096195.svg',
                        height: 21,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      title: Text(
                        "Get Started & FAQs",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      thickness: 2.3,
                      color: Color(0xffF1F1F1),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      height: 49,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffBE3344)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/Group 48096196.svg',
                              height: 33,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
