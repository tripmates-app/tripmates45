import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:tripmates/Constants/button.dart';
import 'package:tripmates/Constants/utils.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  int selectedIndex = 0;
  int selectedIndex1 = 0;

  List<String> _taglist = [];
  final TextEditingController _tagController = TextEditingController();
  List<String> _taglisthobbies = [];
  final TextEditingController _taghobbiesController = TextEditingController();

  List gender = [
    'Male',
    'Female',
    'Non-Binary',
  ];
  List status = [
    'Traveler',
    'Local',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 66, left: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 53,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 126,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/fantasy-shooting-star-landscape-night (1).png'))),
                    child:
                        Center(child: SvgPicture.asset('assets/Add Photo.svg')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20, bottom: 6),
                        child: CircleAvatar(
                          radius: 49,
                          backgroundImage:
                              AssetImage('assets/Group 48096083.png'),
                        ),
                      ),
                      SvgPicture.asset('assets/Add Photo.svg'),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: lefttorightgradient),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 2.3),
                      child: TextFormField(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        cursorHeight: 23,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF1F1F1),
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          border: InputBorder.none,
                          hintText: 'Enter Your Full Name',
                          hintStyle:
                              TextStyle(fontSize: 14, color: Color(0xff7B7575)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Text(
                    'User Name',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: lefttorightgradient),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 2.3),
                      child: TextFormField(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        cursorHeight: 23,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF1F1F1),
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          border: InputBorder.none,
                          hintText: '@Username',
                          hintStyle:
                              TextStyle(fontSize: 14, color: Color(0xff7B7575)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Text(
                    'Bio',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: lefttorightgradient),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 2.3),
                      child: TextFormField(
                        maxLines: 4,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        cursorHeight: 23,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF1F1F1),
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          border: InputBorder.none,
                          hintText: 'Bio',
                          hintStyle:
                              TextStyle(fontSize: 14, color: Color(0xff7B7575)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Text(
                    'Gender',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
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
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: gender.length,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 0,
                                    mainAxisExtent: 57),
                            itemBuilder: (_, index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: selectedIndex == index
                                        ? lefttorightgradient
                                        : LinearGradient(colors: [
                                            Color(0xffF1F1F1),
                                            Color(0xffF1F1F1),
                                          ]),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                  child: Text(
                                    gender[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: selectedIndex == index
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
                    height: 23,
                  ),
                  Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          cursorHeight: 23,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffF1F1F1),
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide.none),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                            border: InputBorder.none,
                            hintText: 'Add Your Location',
                            hintStyle: TextStyle(
                                fontSize: 14, color: Color(0xff7B7575)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 100,
                        height: 57,
                        decoration: BoxDecoration(
                          color: lightBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Add',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: whiteColor),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Text(
                    'Location status:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
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
                            physics: NeverScrollableScrollPhysics(),
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
                    height: 15,
                  ),
                  Text(
                    'Languages',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: TextFormField(
                            controller: _tagController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 13),
                              filled: true,
                              fillColor: Color(0xffF1F1F1),
                              hintText: "Add Lannguages.....",
                              suffixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/s.svg',
                                    height: 23,
                                  ),
                                ],
                              ),
                              hintStyle: TextStyle(
                                  fontSize: 14, color: discriptionColor),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          // Add item to the list
                          if (_tagController.text.isNotEmpty) {
                            setState(() {
                              _taglist.add(_tagController.text.trim());
                              _tagController.clear();
                            });
                          }
                        },
                        child: Container(
                          height: 57,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: lightBlue,
                          ),
                          child: Center(
                            child: Text(
                              'Add',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: whiteColor),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  // Display List of Chips for Equipment
                  Wrap(
                    spacing: 3.0,
                    runSpacing: 4.0,
                    children: List.generate(
                      _taglist.length,
                      (index) => Chip(
                        avatar: SvgPicture.asset(
                          'assets/Group 48096194.svg',
                          height: 17,
                          color: Theme.of(context).primaryColor,
                        ),
                        color:
                            WidgetStatePropertyAll(lightBlue.withOpacity(0.1)),
                        label: Text(_taglist[index]),
                        deleteIcon: Icon(Icons.close),
                        onDeleted: () {
                          setState(() {
                            _taglist
                                .removeAt(index); // Remove item from the list
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 13),

                  Text(
                    'Interests & Hobbies',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: TextFormField(
                            controller: _taghobbiesController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 13),
                              filled: true,
                              fillColor: Color(0xffF1F1F1),
                              hintText: "Add Interests & Hobbies.....",
                              hintStyle: TextStyle(
                                  fontSize: 14, color: discriptionColor),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          // Add item to the list
                          if (_taghobbiesController.text.isNotEmpty) {
                            setState(() {
                              _taglisthobbies
                                  .add(_taghobbiesController.text.trim());
                              _taghobbiesController.clear();
                            });
                          }
                        },
                        child: Container(
                          height: 57,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: lightBlue,
                          ),
                          child: Center(
                            child: Text(
                              'Add',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: whiteColor),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  // Display List of Chips for Equipment
                  Wrap(
                    spacing: 3.0,
                    runSpacing: 4.0,
                    children: List.generate(
                      _taglisthobbies.length,
                      (index) => Chip(
                        avatar: SvgPicture.asset(
                          'assets/sss (2).svg',
                          height: 17,
                        ),
                        color:
                            WidgetStatePropertyAll(lightBlue.withOpacity(0.1)),
                        label: Text(_taglisthobbies[index]),
                        deleteIcon: Icon(Icons.close),
                        onDeleted: () {
                          setState(() {
                            _taglisthobbies
                                .removeAt(index); // Remove item from the list
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: GradientBoxBorder(
                                  gradient: lefttorightgradient, width: 2.3)),
                          child: Center(
                              child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Button(
                          borderRadius: BorderRadius.circular(10),
                          height: 60,
                          width: double.infinity,
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => HomeScreen()));
                          },
                          child: const Center(
                              child: Text(
                            'Save Changes',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 17,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
