import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tripmates/Constants/Apis_Constants.dart';
import 'package:tripmates/Constants/custom_appbar.dart';
import 'package:tripmates/Constants/listdata.dart';
import 'package:tripmates/Constants/utils.dart';
import 'package:tripmates/Controller/MatesController.dart';
import 'package:tripmates/Controller/ProfileController.dart';
import 'package:tripmates/Home_Screen/userinfo_screen.dart';

import '../Controller/AcitivityController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 ProfileController profileController=Get.put(ProfileController());
 Matescontroller matescontroller=Get.put(Matescontroller());
 Acitivitycontroller acitivitycontroller=Get.put(Acitivitycontroller());
 bool  loading=true;



  final CarouselSliderController carouselController =
      CarouselSliderController();
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   apis();
  }


  void apis()async{
    setState(() {
      loading=true;
    });
    await profileController.GetProfile();
    await matescontroller.NearbyMatesMates();
    await acitivitycontroller.DailyActivities();
    setState(() {
      loading=false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75), child: Customappbar()),
      body: RefreshIndicator(
        edgeOffset: 2,
        onRefresh:()async{
          apis();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Stack(
                  children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 175,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff4F78DA)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Hi,.svg',
                                        height: 13,
                                      ),
                                      GetBuilder<ProfileController>(
                                        id: "Profile_update",
                                        builder: (_) {
                                          return Text(
                                            profileController.profile?.userName.toString() ??"Harry",
                                            style: TextStyle(
                                                fontSize: 12, color: whiteColor),
                                          );
                                        }
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "Let's make today unforgettable.\nMeet, explore, and connect",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12, color: whiteColor, height: 2.1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13, top: 13),
                                    child: Container(
                                      width: 150,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          border:
                                              Border.all(color: Color(0xffFBBC05))),
                                      child: Center(
                                        child: Text(
                                          'wherever you go',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffFBBC05)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20, top: 10, bottom: 10),
                                child: Image.asset('assets/Group.png'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    if(loading==true)
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Container(
                              height: 175,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade400,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 13,
                                              width: 13,
                                              color: Colors.grey.shade500,
                                            ),
                                            SizedBox(width: 5),
                                            Shimmer.fromColors(
                                              baseColor: Colors.grey.shade400,
                                              highlightColor: Colors.grey.shade200,
                                              child: Container(
                                                height: 12,
                                                width: 60,
                                                color: Colors.grey.shade500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 3),
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey.shade400,
                                          highlightColor: Colors.grey.shade200,
                                          child: Container(
                                            height: 30,
                                            width: 180,
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey.shade400,
                                          highlightColor: Colors.grey.shade200,
                                          child: Container(
                                            width: 150,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              color: Colors.grey.shade500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey.shade400,
                                        highlightColor: Colors.grey.shade200,
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 15,
                ),

                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 83,
                              decoration: BoxDecoration(
                                gradient: toptobottomgradient.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: GradientBoxBorder(
                                    width: 1.9, gradient: toptobottomgradient),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Find People\nin your Area',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Image.asset(
                                    'assets/146541622_8c73c2f4-86cd-4d08-94e0-342fd74b7ab1 1 (1).png',
                                    height: 47,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              height: 83,
                              decoration: BoxDecoration(
                                gradient: toptobottomgradient.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: GradientBoxBorder(
                                    width: 1.9, gradient: toptobottomgradient),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Explore Local\nActivities',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Image.asset(
                                    'assets/Group 48095798.png',
                                    height: 47,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if(loading)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                height: 83,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 13,
                                          width: 100,
                                          color: Colors.grey.shade500,
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                          height: 13,
                                          width: 80,
                                          color: Colors.grey.shade500,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 47,
                                      width: 47,
                                      color: Colors.grey.shade500,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                height: 83,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 13,
                                          width: 100,
                                          color: Colors.grey.shade500,
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                          height: 13,
                                          width: 80,
                                          color: Colors.grey.shade500,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 47,
                                      width: 47,
                                      color: Colors.grey.shade500,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),


                SizedBox(
                  height: 19,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Nearby People',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),


                Stack(
                  children: [
                    (matescontroller.nearbyMates?.users?.isEmpty ?? true)?
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Ops: there is no Nearby Mates"),
                          Image.asset("assets/NoData.png",width: 300,)
                        ],
                      ),
                    )
                        :
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Container(
                        height: 410,
                        width: double.infinity,
                        child: CardSwiper(
                          cardsCount: (matescontroller.nearbyMates?.users?.length ?? 0) < 2
                              ? 2 // Ensuring at least 2 cards
                              : matescontroller.nearbyMates!.users!.length,

                          cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
                            if (matescontroller.nearbyMates?.users != null &&
                                index < matescontroller.nearbyMates!.users!.length) {
                              final user = matescontroller.nearbyMates!.users![index];
                              final name = user.user?.userName ?? "Unknown";
                              final age = user.age?.toString() ?? "N/A";
                              final id = user.userID?.toString() ?? "N/A";
                              final gender = user.gender ?? "N/A";
                              final isliked = user.hasLiked ?? false;
                              final image = (user.images?.isNotEmpty ?? false)
                                  ? NetworkImage("${Apis.ip}${user.images!.first}")
                                  : AssetImage('assets/Group 48095841.png') as ImageProvider;
                              final image2 =  user.countryFlag;

                              return buildCard(id,name, age, gender, image,image2.toString(),isliked,context);
                            } else {
                              // Default fallback cards when users are less than 2
                              return buildCard("1","Harry", "N/A", "N/A", AssetImage('assets/Group 48095841.png'),"assets/Group 48095841.png",false,context);
                            }
                          },
                        ),
                      ),
                    ),


                    if(loading)
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Container(
                              height: 410,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade400,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 13,
                                              width: 13,
                                              color: Colors.grey.shade500,
                                            ),
                                            SizedBox(width: 5),
                                            Shimmer.fromColors(
                                              baseColor: Colors.grey.shade400,
                                              highlightColor: Colors.grey.shade200,
                                              child: Container(
                                                height: 12,
                                                width: 60,
                                                color: Colors.grey.shade500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 3),
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey.shade400,
                                          highlightColor: Colors.grey.shade200,
                                          child: Container(
                                            height: 30,
                                            width: 180,
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey.shade400,
                                          highlightColor: Colors.grey.shade200,
                                          child: Container(
                                            width: 150,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              color: Colors.grey.shade500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey.shade400,
                                        highlightColor: Colors.grey.shade200,
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),


                SizedBox(
                  height: 19,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Daily Activities',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 19,
                ),
                (acitivitycontroller.dailyActivites?.activities?.isEmpty ?? true)?
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Ops: there is no Acitivities"),
                      Image.asset("assets/NoData.png",width: 300,)
                    ],
                  ),
                ) :GetBuilder<Acitivitycontroller>(
                  id: "Activity_update",
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: CarouselSlider.builder(
                        carouselController: carouselController,
                        itemCount: acitivitycontroller.dailyActivites?.activities?.length??0,
                        itemBuilder: (context, index, realIndex) {
                          if(loading){
                            return  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 370,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }else{

                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Color(0xffF1F1F1),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Image.network(
                                          "${Apis.ip}${acitivitycontroller.dailyActivites?.activities?[index].images?.first.toString() ?? ""}",
                                          fit: BoxFit.cover,
                                          height: 150,
                                          width: double.infinity,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              height: 150,
                                              width: double.infinity,
                                              color: Colors.grey[300], // Optional background color
                                              child: Icon(
                                                Icons.image, // Default image icon
                                                size: 50,
                                                color: Colors.grey[600],
                                              ),
                                            );
                                          },
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/Group 48095897.svg',
                                                height: 21,
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              SvgPicture.asset(
                                                'assets/Group 48095896.svg',
                                                height: 21,
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              SvgPicture.asset(
                                                'assets/Group.svg',
                                                height: 21,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(9.0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/Page-1.svg',
                                                  height: 21,
                                                ),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Container(
                                                  width: 139,
                                                  child: Text(
                                                    dailyActivities[index].location,
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w500,
                                                        color: whiteColor),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10, top: 10),
                                      child: Text(
                                        acitivitycontroller.dailyActivites?.activities?[index].time.toString().substring(0,5)??"",
                                        style: TextStyle(
                                            fontSize: 13, color: Color(0xff339003)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10, right: 10),
                                      child: Text(
                                        acitivitycontroller.dailyActivites?.activities?[index].name.toString()??"",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10, right: 10),
                                      child: Text(
                                        acitivitycontroller.dailyActivites?.activities?[index].description.toString()??"",
                                        style: TextStyle(
                                            fontSize: 12, color: Color(0xff4D4D4D)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }

                        },
                        options: CarouselOptions(
                          initialPage: 0,
                          height: 300,
                          padEnds: false,

                          viewportFraction:
                              0.6, // Show part of the next/previous items
                          enableInfiniteScroll: false,

                          reverse: false,
                          animateToClosest: true,
                          disableCenter: true,
                          aspectRatio: 1,
                          enlargeCenterPage: false,
                          autoPlay: false, // Highlight the center item
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index; // Update the active page index
                            });
                          },
                        ),
                      ),
                    );
                  }
                ),
                const SizedBox(height: 19),

                // Smooth Page Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    // cardscontroller.specialOffers?.specialOffers?.length ?? 0,
                    acitivitycontroller.dailyActivites?.activities?.length ??0 ,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 13,
                      width: _currentIndex == index ? 13 : 13,
                      decoration: BoxDecoration(
                        gradient: _currentIndex == index
                            ? lefttorightgradient
                            : lefttorightgradient.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 19,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Upcoming Activities',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 19,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: upcommingActivities.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 190,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            upcommingActivities[index].image))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 27,
                                            backgroundImage: AssetImage(
                                                upcommingActivities[index]
                                                    .profile),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 170,
                                                child: Text(
                                                  upcommingActivities[index]
                                                      .adventure,
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/Page-1.svg',
                                                    height: 14,
                                                  ),
                                                  SizedBox(
                                                    width: 7,
                                                  ),
                                                  Container(
                                                    width: 160,
                                                    child: Text(
                                                      upcommingActivities[index]
                                                          .location,
                                                      style: TextStyle(
                                                          fontSize: 9,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    upcommingActivities[index]
                                                        .date,
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color(0xff00D4BD)),
                                                  ),
                                                  Text(
                                                    upcommingActivities[index]
                                                        .time,
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color(0xff00D4BD)),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Container(
                                                width: 241,
                                                child: Text(
                                                  upcommingActivities[index]
                                                      .discription,
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Color(0xff5A5A5A)),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        size: 31,
                                                        color: whiteColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                '08/10 Joined',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: whiteColor),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 21,
                                                width: 49,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(30),
                                                    color: Colors.black54),
                                                child: Center(
                                                  child: Text(
                                                    'Skip',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: whiteColor),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 21,
                                                width: 57,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(30),
                                                    color: Color(0xff339003)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Join',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: whiteColor),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    SvgPicture.asset(
                                                        'assets/Group 48096111.svg')
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/Group 48095897.svg',
                                      height: 21,
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    SvgPicture.asset(
                                      'assets/Group 48095896.svg',
                                      height: 21,
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    SvgPicture.asset(
                                      'assets/Group.svg',
                                      height: 21,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            'assets/Group 48095897.svg',
                            height: 21,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          SvgPicture.asset(
                            'assets/Group 48095896.svg',
                            height: 21,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          SvgPicture.asset(
                            'assets/Group.svg',
                            height: 21,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget buildCard( String id,   String name, String age, String gender, ImageProvider image,String image2,bool Isliked,BuildContext context ) {
  Matescontroller matescontroller=Get.put(Matescontroller());

  return InkWell(
    onTap: (){
      Get.to(()=> UserinfoScreen(id: id,));
    },
    child: Container(
      width: double.infinity,
      height: 410,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: image,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle, // Makes it fully circular
                  ),
                  child: ClipOval(
                    child: SvgPicture.network(
                      image2.toString(), // Replace with your SVG URL
                      fit: BoxFit.cover, // Ensures it fills the container properly
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),

                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '$name, $age, $gender',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        SizedBox(width: 7),
                        SvgPicture.asset('assets/Vector (2).svg', height: 19),
                      ],
                    ),
                    SizedBox(height: 7),
                    Container(
                      height: 27,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff4F78DA),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/h.svg', height: 13),
                            SizedBox(width: 5),
                            Text('Local', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap:()async{
                      // await matescontroller.LikedMates(id,context);
                      // await matescontroller.MatesFilter("20", "50", "both", "All", ["english"], "traveling");
                    },
                    child: SvgPicture.asset('assets/Group 48095816.svg', height: 41)),
                SizedBox(width: 30),
                InkWell(
                    onTap: ()async{
                      print("The is liked : ${Isliked}");
                      await matescontroller.LikedMates(id,context);
                      await matescontroller.MatesFilter("", "", "", "", [""], "",[]);
                    },
                    child:Isliked? Icon(Icons.favorite,color: Colors.green,size: 40,)  :SvgPicture.asset('assets/Group 48095815.svg', height: 41)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}