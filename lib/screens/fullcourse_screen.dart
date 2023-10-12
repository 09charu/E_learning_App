import 'package:flutter/material.dart';

void main() {
  runApp(FullCourseScreen());
}

class Course {
  final String title;
  final String description;
  final String instructor;
  final String imageAsset;


  Course({
    required this.title,
    required this.description,
    required this.instructor,
    required this.imageAsset,
  });
}

class FullCourseScreen extends StatefulWidget {
  @override
  _FullCourseScreenState createState() => _FullCourseScreenState();
}

class _FullCourseScreenState extends State<FullCourseScreen> {
  List<Course> courses = [
    Course(
      title: "UPSC",
      description: "55 Videos",
      instructor: "Instructor 1",
      imageAsset: "images/upsc.png", //Asset path to the image
    ),
    Course(
      title: "IIT",
      description: "105 Videos",
      instructor: "Instructor 2",
      imageAsset: "images/iit.png", // Asset path to the image
    ),
    Course(
      title: "NEET",
      description: "125 Videos",
      instructor: "Instructor 3",
      imageAsset: "images/neet.png", // Asset path to the image
    ),
    Course(
      title: "BANK",
      description: "105 Videos",
      instructor: "Instructor 3",
      imageAsset: "images/bank.png", // Asset path to the image
    ),
    Course(
      title: "SSC JE",
      description: "85 Videos",
      instructor: "Instructor 3",
      imageAsset: "images/ssc.png", // Asset path to the image
    ),
    Course(
      title: "CAT",
      description: "85 Videos",
      instructor: "Instructor 3",
      imageAsset: "images/cat.png", // Asset path to the image
    ),
    Course(
      title: "CBSE",
      description: "85 Videos",
      instructor: "Instructor 3",
      imageAsset: "images/cbse.png", // Asset path to the image
    ),
    Course(
      title: "CA",
      description: "25 Videos",
      instructor: "Instructor 3",
      imageAsset: "images/ca.png", // Asset path to the image
    ),
    Course(
      title: "NDA",
      description: "25 Videos",
      instructor: "Instructor 3",
      imageAsset: "images/nda.png", // Asset path to the image
    ),
    Course(
      title: "CDS",
      description: "25 Videos",
      instructor: "Instructor 3",
      imageAsset: "images/cds.png", // Asset path to the image
    ),
    Course(
      title: "CLAT",
      description: "25 Videos",
      instructor: "Instructor 3",
      imageAsset: "images/clat.png", // Asset path to the image
    ),

    // Add more courses
  ];

  List<Course> filteredCourses = [];

  @override
  void initState() {
    super.initState();
    // Initialize the filteredCourses list with all courses initially.
    filteredCourses.addAll(courses);
  }

  void filterCourses(String query) {
    setState(() {
      filteredCourses = courses.where((course) {
        final titleLower = course.title.toLowerCase();
        final descriptionLower = course.description.toLowerCase();
        final instructorLower = course.instructor.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            descriptionLower.contains(searchLower) ||
            instructorLower.contains(searchLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFCAC19A),
          title: Center(child: Text('All Courses',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ))
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/standgirlpen3.png'), // Replace with your image asset
                fit: BoxFit.cover, // Adjust this property as needed
              ),
            ),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for courses...',
                    hintStyle: TextStyle(
                      // fontWeight: FontWeight.bold, // Set the desired font weight
                      fontSize: 18.0,
                      color: Color(0xFF5D5B51),// Customize font size as needed
                      // You can also customize other text properties here (color, etc.)
                    ),
                    prefixIcon: Icon(Icons.search,
                      color:Color(0xFF5D5B51)),
                  ),
                  onChanged: (query) {
                    filterCourses(query);
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredCourses.length,
                    itemBuilder: (context, index) {
                      final course = filteredCourses[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: ListTile(
                          leading: Image.asset(
                            course.imageAsset,
                            width: 60, // Customize the image size as needed
                            height: 60,
                          ),
                          title: Text(course.title),
                          subtitle: Text(course.description),
                          trailing: Text(course.instructor),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
