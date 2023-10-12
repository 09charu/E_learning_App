import 'package:flutter/material.dart';
import 'package:untitled2/screens/description_screen.dart';
import 'package:untitled2/screens/videos_section.dart';

class CourseScreen extends StatefulWidget {
  String img;
  CourseScreen(this.img);
  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {

  bool isVideoSection = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.img,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications_outlined,
              size: 28,
              color: Color(0xFFDE9151),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("images/${widget.img}.png"),
                  )
              ),
              // child: Center(
              //   child: Container(
              //     padding: EdgeInsets.all(5),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       shape: BoxShape.circle,
              //     ),
              //     child: Icon(
              //       Icons.play_arrow_rounded,
              //       color: Color(0xFFDE9151),
              //       size: 45,
              //     ),
              //   ),
              // ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Text(
                "${widget.img} Complete course",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Text("Created by Dear Programmer", style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.7)
              ),),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Text("55 Videos", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.5)
              ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    //if isVideoSection is true and else
                    color: isVideoSection
                        ? Color(0xFF0CA8BC)
                        : Color(0xFF0CA8BC).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          isVideoSection = true;
                        });
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                        child: Text(
                          "Videos",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: isVideoSection
                        ? Color(0xFF0CA8BC).withOpacity(0.6)
                        : Color(0xFF0CA8BC),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          isVideoSection = false;
                        });
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                        child: Text(
                          "Description",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            isVideoSection ? VideoSection() : DescriptionSection(),
          ],
        ),
      ),
    );
  }
}
