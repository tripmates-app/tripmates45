import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tripmates/Constants/button.dart';
import 'package:tripmates/Constants/listdata.dart';
import 'package:tripmates/Constants/utils.dart';

class BadgesScreen extends StatefulWidget {
  const BadgesScreen({super.key});

  @override
  State<BadgesScreen> createState() => _BadgesScreenState();
}

class _BadgesScreenState extends State<BadgesScreen> {
  int selectedIndex1 = 0;
  List status = [
    'Badges',
    'Leaderboard',
  ];
  final _fromTop = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Color(0xffF1F1F1),
        surfaceTintColor: Theme.of(context).cardColor,
        backgroundColor: Theme.of(context).cardColor,
        toolbarHeight: 70,
        leading: Icon(
          Icons.arrow_back,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          'Achievements & Rewards',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF1F1F1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: status.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 0,
                                  mainAxisExtent: 57),
                          itemBuilder: (_, index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex1 = index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: selectedIndex1 == index
                                      ? lefttorightgradient
                                      : LinearGradient(colors: [
                                          Color(0xffF1F1F1),
                                          Color(0xffF1F1F1),
                                        ]),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Text(
                                  status[index],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: selectedIndex1 == index
                                        ? whiteColor
                                        : discriptionColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '2',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Badges Unlocked',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      color: Theme.of(context).cardColor,
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      child: Column(
                        children: [
                          Card(
                            color: whiteColor,
                            elevation: 4,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/ban.png'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'First Meetup',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '7d ago',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).hintColor),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 50,
                      child: Column(
                        children: [
                          Card(
                            color: whiteColor,
                            elevation: 4,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/ban.png'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Verified Badge',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '7d ago',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).hintColor),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 50,
                      child: Column(
                        children: [
                          Card(
                            color: whiteColor,
                            elevation: 4,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/ban.png'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Earn Badge',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Achievements',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GradientText(
                      'See All',
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                      colors: [
                        Color(0xff007BFD),
                        Color(0xff20235A),
                      ],
                    ),
                  ],
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: achievementsData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: Container(
                          height: 84,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffF1F1F1)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 4, right: 16, top: 3, bottom: 3),
                            child: Row(
                              children: [
                                Card(
                                  color: whiteColor,
                                  elevation: 4,
                                  child: Container(
                                    margin: EdgeInsets.all(7),
                                    height: 56,
                                    width: 56,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            achievementsData[index].bandge),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 13,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        achievementsData[index].name,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        achievementsData[index].discription,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                    onTap: () {
                                      alertBox();
                                    },
                                    child: achievementsData[index].status),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: 15,
                ),
              ],
            )),
      ),
    );
  }

  alertBox() {
    showGeneralDialog(
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        transitionBuilder: (context, anim1, anim2, child) {
          return SlideTransition(
            position: Tween(
                    begin: Offset(0, _fromTop ? -1 : 1),
                    end: const Offset(0, 0))
                .animate(anim1),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
        barrierColor: Colors.black.withOpacity(0.6),
        context: context,
        pageBuilder: (context, anim1, anim2) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Dialog(
                insetPadding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                // backgroundColor: Colors.black,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Theme.of(context).cardColor),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/Group 48096002.png', height: 179),
                        SizedBox(
                          height: 30,
                        ),
                        SvgPicture.asset(
                          'assets/Congrats!.svg',
                          height: 40,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'You Just Unlocked a new Badge',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Explore our app and level up your rank in city to claim exclusive badges.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).indicatorColor),
                          ),
                        ),
                        SizedBox(
                          height: 47,
                        ),
                        Button(
                            width: double.infinity,
                            height: 64,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            child: Center(
                              child: Text(
                                'Explore our App',
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: whiteColor),
                              ),
                            ),
                            onTap: () {})
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }
}
