import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tripmates/Constants/button.dart';
import 'package:tripmates/Constants/listdata.dart';
import 'package:tripmates/Constants/utils.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
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
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      'This Leaderboard in Your City ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: leaderboardData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              height: 83,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: leaderboardData[index].color),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 4, right: 16, top: 3, bottom: 3),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 26,
                                      backgroundImage: AssetImage(
                                        leaderboardData[index].profile,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            leaderboardData[index].name,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Text(
                                            leaderboardData[index].discription,
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
                                    Image.asset(
                                      leaderboardData[index].leaderboard,
                                      height: 46,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 23, top: 48),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: whiteColor),
                                        shape: BoxShape.circle,
                                        color: Color(0xff4F78DA)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Center(
                                          child: Text(
                                        '1',
                                        style: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold,
                                            color: whiteColor),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
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
}
